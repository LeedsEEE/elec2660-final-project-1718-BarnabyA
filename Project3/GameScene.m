//
//  GameScene.m
//  Project3
//
//  Created by Barnaby Ayriss [el16ba] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "GameScene.h"
@interface GameScene()

@property int gameState;
@property int numGameState;
@property int currentScore;
@property CGPoint finishCoord;

//lastJumpTimeInterval and lastJumpUpdateTimeInterval have been adapted from the updateWithTimeSinceLastUpdate method

@property (nonatomic) NSTimeInterval lastJumpTimeInterval;
@property (nonatomic) NSTimeInterval lastJumpUpdateTimeInterval;

@end

@implementation GameScene {
    //Defining nodes in scene
    GameObjects *ground;
    Player *player;
    SKCameraNode *_nodeCamera;
    GameLabel *lbSKScore;

    /* Game state
        0: Not Started
        1: Started
        2: End Fail
        3: End win
        4: Paused
        5: Completed Game
    */
}

#pragma mark - level Generation
- (void)didMoveToView:(SKView *)view {
    //Sets the
    self.currentLevel = 0;
    self.gameFont = @"TrebuchetMS";
    self.levelData = [[DataModelLevels alloc]init];
    
    [self initializeGame];
}

-(void)initializeGame{
    //Loades the Games defualt values
    //creating the player and ground nodes which are referances for may other operations
    //as well as other operations detailed below
    
    NSLog(@"GameScean/initialize- frame sizes %.0f,%0.f", self.frame.size.width,self.frame.size.height);
    self.numGameState= 6;
    //getting camera node from sks scene
    _nodeCamera = (SKCameraNode *)[self childNodeWithName:@"nodeCamera"];
    
    //setting refence point for drawing other nodes
    self.anchorPoint = CGPointMake(0.5, 0.5);
    self.physicsWorld.contactDelegate = self;
    
    //Setting nodes to correct ids 
    ground = [GameObjects platform];
    player = [Player player];
    lbSKScore = [GameLabel lbScore:self.gameFont];
    NSLog(@"GameScean/initialize- gameplay nodes instances created");
    
    //setting node names
    ground.name = @"ground";
    player.name = @"player";
    lbSKScore.name = @"lbSKScore";
    
    NSLog(@"GameScean/initialize- gameplay node's named");
    
    //setting node sizes
    ground.size = CGSizeMake(self.frame.size.width,30);
    
    NSLog(@"GameScean/initialize- gameplay node's sizes set");
    
    //setting start positions of ground node
    ground.position = CGPointMake(0, -player.size.height/2 - ground.size.height/2);
    lbSKScore.position = CGPointMake(-self.frame.size.width/2 + 75, self.frame.size.height/2 - 40);
    NSLog(@"GameScean/initialize- gameplay node's starting positions");
    
    //setting physics of ground node
    ground.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ground.size];
    ground.physicsBody.dynamic = false;
    
    player.isInAir = false;
    player.cannotJump = true;
    NSLog(@"GameScean/initialize- gameplay node physics set");
    
    //adding nodes to view
    [self addChild:player];
    NSLog(@"GameScean/initialize- player node added to frame");
    [self addChild:ground];
    NSLog(@"GameScean/initialize- ground node added to frame");
    
    
    [_nodeCamera addChild:lbSKScore];
    

    [self setCameraTracking:player];
    
    NSLog(@"GameScean/initialize- Camera position set");
    
    [self loadLevel:self.currentLevel];
    
}

-(void)setCameraTracking:(SKNode *)targetNode{
    //sets the camera to track the target the arguemtn node
    [_nodeCamera moveToParent:targetNode];
    _nodeCamera.position = CGPointMake(_nodeCamera.parent.position.x + self.frame.size.width/3, ground.position.y);
    NSLog(@"GameScean/setCameraTracking- Camera tracking %@", targetNode.name);
}

-(void)loadLevel:(int)levelNum {
    //loades a specific level from the level array
    
    Level *tempLevel = [self.levelData.levelsArray objectAtIndex:levelNum];
    GameObjects *tempGameObjectCurrent = [GameObjects platform];
    GameObjects *tempGameObjectPrevious = [GameObjects platform];
    
    //Removes previous level
    [ground removeAllChildren];
    NSLog(@"GameScean/loadLevel- Loading Level %i", levelNum);
    NSLog(@"GameScean/loadLevel- Loading %lu gameObjects", tempLevel.gameObjectsArray.count);
    
    for (int i = 0; i < tempLevel.gameObjectsArray.count; i++) {
        tempGameObjectCurrent = [tempLevel.gameObjectsArray objectAtIndex:i];
        if(tempGameObjectCurrent.parent){
            [tempGameObjectCurrent removeFromParent];
        }
        //sets the bitmask of the gameobjects to register collision
        tempGameObjectCurrent.physicsBody.categoryBitMask = 0x1 << 1;
        NSLog(@"GameScean/loadLevel- adding gameObject name: %@", tempGameObjectCurrent.name);
        
        //checks if the gameObject bieng assed is the first or last object so it can be assigned special properties
        if (i == 0){
            tempGameObjectCurrent.position = CGPointMake(ground.size.width/2, tempGameObjectCurrent.position.y);
            [ground addChild:tempGameObjectCurrent];
        }else{
            if(i == tempLevel.gameObjectsArray.count - 1){
                tempGameObjectCurrent.color = [UIColor magentaColor];
                tempGameObjectCurrent.name = @"gameObjectFinish";

                
            }
            [tempGameObjectPrevious addChild:tempGameObjectCurrent];
        }
        tempGameObjectPrevious = tempGameObjectCurrent;
        self.finishCoord = [self convertPoint:tempGameObjectCurrent.position fromNode:tempGameObjectCurrent.parent];
    }
    NSLog(@"GameScean/loadLevel- fianl coord: ( %0.f, %0.f )",self.finishCoord.x,self.finishCoord.y);
    player.physicsBody.dynamic = false;
    player.position = CGPointMake(0,0);
    [player removeAllActions];
    [lbSKScore resetScore];
}

#pragma mark - Running Game
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //checks the game state upon a touch event and makes actions accordingly
    if(self.gameState == 0){
        //Begins a level
        NSLog(@"GameScean/touchesBegan- Game start");
        player.cannotJump = false;
        player.isInAir = false;
        [self beginGame];
    } else if (self.gameState == 1){
        //causes the player to jump
        [player jump:self.physicsWorld.gravity];
    }else if(self.gameState == 4){
        //unpauses the game
        NSLog(@"GameScean/touchesBegan- Game unpause");
        [player pause];
        [self beginGame];
    }else if(self.gameState == 5){
        //move to title menu
        [self._parentViewController performSegueWithIdentifier:@"GameTitle" sender:self._parentViewController];

    }else if (self.gameState > self.numGameState - 1){
        NSLog(@"GameScean/touchesBegan- ERROR invalid game state");
    }
}

-(void)beginGame{
    //Starts the game moving from an inactive state
    NSLog(@"GameScean/beginGame- Beginging Game");
    self.gameState = 1;
    [self removeMessages];
    [self setCameraTracking:player];
    [self alterLevelAlpha:1 includeCamera:true];
    player.physicsBody.dynamic = true;
    [player moveXPositiveForever:1.5];
    
}

//altered update method adapted from source: https://www.raywenderlich.com/42699/spritekit-tutorial-for-beginners
- (void)update:(NSTimeInterval)currentTime {
    // Handle time delta.
    // If we drop below 60fps, we still want everything to move the same distance.
    // Used to check the player cannot jump befreo the cool down has finished
    CFTimeInterval timeSinceLast = currentTime - self.lastJumpUpdateTimeInterval;
    self.lastJumpUpdateTimeInterval = currentTime;
    if (timeSinceLast > 1) { // more than a second since last update
        timeSinceLast = 1.0 / 60.0;
        self.lastJumpUpdateTimeInterval = currentTime;
    }
    [self updateWithTimeSinceLastUpdate:timeSinceLast];
    //Increases the players score if the player has jumped into the air
    if (player.isInAir == true){
        GameLabel *templbSKScore = (GameLabel *)[_nodeCamera childNodeWithName:@"lbSKScore"];
        [templbSKScore increaseScore];
    }
}

//updateWithTimeSinceLastUpdate source: https://www.raywenderlich.com/42699/spritekit-tutorial-for-beginners
- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLastJump {
    //Compares the current time cahnge from when the jump was initiated
    self.lastJumpTimeInterval += timeSinceLastJump;
    if (self.lastJumpTimeInterval > 1.5) {
        self.lastJumpTimeInterval = 0;
        player.cannotJump = false;
    }
}
-(void)didBeginContact:(SKPhysicsContact *)contact{
    //stops the player from aquireing points after collising with an object
    NSLog(@"contact began");
    player.isInAir = false;
}

#pragma mark - Changing Game State

-(void)determinGameState{
    //determins the game state and mkaes actions accordingly
    if (player.position.y < ground.position.y){
        //level failed state
        self.gameState = 2;
        self.currentScore = 0;
        [self endGame];
        
    }else if(player.position.x > self.finishCoord.x && self.gameState != 5) {
        //Level complete state
        self.gameState = 3;
        self.currentScore = lbSKScore.currentScore;
        if(self.currentLevel < self.levelData.levelsArray.count - 1){
            NSLog(@"GameScean/determinGameState- incrementing current level");
            self.currentLevel++;
            [self endGame];
            lbSKScore.currentScore = self.currentScore;
        }else{
            SKLabelNode *completionMsg = [GameLabel lbCompleteMsg:self.gameFont score:lbSKScore.self.currentScore];
            //Game complete state
            self.gameState = 5;
            [player pause];
            [_nodeCamera addChild:completionMsg];
            [self alterLevelAlpha:0.25 includeCamera:false];
        }
    }else if( self.gameState == 4){
        //pause state
        NSLog(@"GameScean/determinGameState- paused");
        [self pauseGame];
        
    }else if (self.gameState > self.numGameState - 1){
        //Invalid game state
        NSLog(@"GameScean/determinGameState- ERROR invalid game state");
    }
}

-(void)didSimulatePhysics{
    //determins the game state after applying physics
    [self determinGameState];
    
}

-(void)pauseGame{
    //pauses the game
    self.gameState = 4;
    [player removeActionForKey:@"moveXPositiveForever"];
    player.physicsBody.dynamic = false;
    [self alterLevelAlpha:0.5 includeCamera:false];
}

-(void)endGame{
    //displayes end of game messages upon level completion or failiure
    NSLog(@"GameScean/determinGameState- EndingGame");
    player.isInAir = false;
    SKLabelNode *lbSKEndMessage = [GameLabel lbEndMsg:self.gameState font: self.gameFont];
    [self resetStage];
    [self alterLevelAlpha:0.25 includeCamera:false];
    [_nodeCamera addChild:lbSKEndMessage];
}

-(void)resetStage{
    //resets the stage and loads the next level/current
    NSLog(@"GameScean/resetStage- Resetting Scene");
    player.physicsBody.dynamic = false;
    [player removeAllActions];
    player.position = CGPointMake(0, 0);
    [self removeChildChain:ground];
    [ground removeAllChildren];
    [self loadLevel:self.currentLevel];
    [lbSKScore updateScore:self.currentScore];
    self.gameState = 0;
}

-(void)removeChildChain:(SKNode *)targetNode{
    //recursive method that iterates down the child chail and removes the children as it returns to the top
    SKNode *tempNode = [[SKNode alloc]init];
    if (targetNode.children != NULL && targetNode.children.count != 0 ){
        NSLog(@"GameScene/removeChildChain- Target name: %@",targetNode.name);
        tempNode = targetNode.children[0];
        [self removeChildChain:tempNode];
        NSLog(@"GameScene/removeChildChain-removing from parent: %@",tempNode.name);
        [tempNode removeFromParent];
    }else{
        NSLog(@"Child chain end: %@",targetNode.name);
    }
}

-(void)alterLevelAlpha:(float)alpha includeCamera:(bool)includeCamera{
    //changes the alpha of nodes in scean to more clearly display messages
    if (includeCamera  == false){
        [_nodeCamera moveToParent:self];
    }else if (includeCamera  == true){
        [_nodeCamera moveToParent:player];
    }
    player.alpha = alpha;
    ground.alpha = alpha;
}

-(void)removeMessages{
    //Removes messages from the scena
    NSLog(@"GameScean/removeMessages");
    [_nodeCamera removeAllChildren];
    [_nodeCamera addChild:lbSKScore];
    
}
@end
