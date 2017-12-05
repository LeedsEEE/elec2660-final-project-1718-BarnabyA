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
    */
}

#pragma mark - level Generation
- (void)didMoveToView:(SKView *)view {
    self.currentLevel = 0;
    self.Gamefont = @"TrebuchetMS";
    [self initialize];
}

-(void)initialize{
    NSLog(@"GameScean/initialize- frame sizes %.0f,%0.f", self.frame.size.width,self.frame.size.height);
    self.numGameState= 5;
    
    //getting camera node from sks scene
    _nodeCamera = (SKCameraNode *)[self childNodeWithName:@"nodeCamera"];
    
    //setting refence point for drawing other nodes
    self.anchorPoint = CGPointMake(0.5, 0.5);
    self.physicsWorld.contactDelegate = self;
    
    //Setting nodes to correct ids 
    ground = [GameObjects platform];
    player = [Player player];
    lbSKScore = [GameLabel lbScore:self.Gamefont];
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
    NSLog(@"GameScean/initialize- gameplay node physics set");
    
    //adding nodes to view
    [self addChild:player];
    NSLog(@"GameScean/initialize- player node added to frame");
    [self addChild:ground];
    NSLog(@"GameScean/initialize- ground node added to frame");
    
    
    [_nodeCamera addChild:lbSKScore];
    

    [self setCameraTracking:player];
    
    NSLog(@"GameScean/initialize- Camera position set");
    self.levelData = [[DataModelLevels alloc]init];
    [self loadLevel:self.currentLevel];
    
}

-(void)setCameraTracking:(SKNode *)targetNode{
    [_nodeCamera moveToParent:targetNode];
    _nodeCamera.position = CGPointMake(_nodeCamera.parent.position.x + self.frame.size.width/3, ground.position.y);
    NSLog(@"GameScean/setCameraTracking- Camera tracking %@", targetNode.name);
}

-(void)loadTestLevel{
    //loades a basic level for testing
    
    NSLog(@"GameScean/loadTestLevel- Loading Test Level");
    
    GameObjects *platform0;
    GameObjects *platform1;
    
    platform0 = [GameObjects platform];
    platform1 = [GameObjects platform];
    
    platform0.name = @"platform0";
    platform1.name = @"platform1";
    
    platform0.size = CGSizeMake(150, ground.size.height);
    platform1.size = platform0.size;
    
    platform0.position = CGPointMake(ground.position.x + ground.size.width/2 + platform0.size.width/2,
                                     ground.position.y + 100);
    platform1.position = CGPointMake(platform0.position.x + platform0.size.width,
                                     ground.position.y);
    
    platform0.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:platform0.size];
    platform0.physicsBody.dynamic = false;
    platform1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:platform1.size];
    platform1.physicsBody.dynamic = false;
    
    [self addChild:platform0];
    NSLog(@"GameScean/loadTestLevel- platform0 node added to frame");
    [self addChild:platform1];
    NSLog(@"GameScean/loadTestLevel- platform1 node added to frame");
}


-(void)loadLevel:(int)levelNum {
    Level *tempLevel = [self.levelData.levelsArray objectAtIndex:levelNum];
    GameObjects *tempGameObjectCurrent = [GameObjects platform];
    GameObjects *tempGameObjectPrevious = [GameObjects platform];
    
    [ground removeAllChildren];
    NSLog(@"GameScean/loadLevel- Loading Level %i", levelNum);
    NSLog(@"GameScean/loadLevel- Loading %lu gameObjects", tempLevel.gameObjectsArray.count);
    
    for (int i = 0; i < tempLevel.gameObjectsArray.count; i++) {
        tempGameObjectCurrent = [tempLevel.gameObjectsArray objectAtIndex:i];
        if(tempGameObjectCurrent.parent){
            [tempGameObjectCurrent removeFromParent];
        }
        NSLog(@"GameScean/loadLevel- gameObject %i",i);
        NSLog(@"GameScean/loadLevel- properties");
        NSLog(@"GameScean/loadLevel- name: %@", tempGameObjectCurrent.name);
        NSLog(@"GameScean/loadLevel- size %0.f, %0.f",tempGameObjectCurrent.size.height,tempGameObjectCurrent.size.width);
        
        tempGameObjectCurrent.physicsBody.categoryBitMask = 0x1 << 1;
        
        if (i == 0){
            tempGameObjectCurrent.position = CGPointMake(tempGameObjectCurrent.position.x, tempGameObjectCurrent.position.y);
            [ground addChild:tempGameObjectCurrent];
        }else{
            if(i == tempLevel.gameObjectsArray.count - 1){
                tempGameObjectCurrent.color = [UIColor magentaColor];
                tempGameObjectCurrent.name = @"gameObjectFinish";
                tempGameObjectCurrent.physicsBody.categoryBitMask = 0x1 << 2;
                self.finishCoord = [self convertPoint:tempGameObjectCurrent.position fromNode:tempGameObjectCurrent];
            }
            [tempGameObjectPrevious addChild:tempGameObjectCurrent];
        }
        tempGameObjectPrevious = tempGameObjectCurrent;
        self.finishCoord = [self convertPoint:tempGameObjectCurrent.position fromNode:tempGameObjectCurrent];
    }
    [lbSKScore resetScore];
}

#pragma mark - Running Game
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //Causes player to jump when screen is touched
    //Player *playerTemp = (Player *)[self childNodeWithName:@"player"];
    
    
    if(self.gameState == 0){
        NSLog(@"GameScean/touchesBegan- Game start");
        player.cannotJump = false;
        player.isInAir = false;
        [self beginGame];
    } else if (self.gameState == 1){
        NSLog(@"GameScean/touchesBegan- Jump");
        //[playerTemp jump];
        [player jump];
        
    }else if(self.gameState == 4){
        NSLog(@"GameScean/touchesBegan- Game unpause");
        player.cannotJump = false;
        [self beginGame];
        
    }else if (self.gameState > self.numGameState - 1){
        NSLog(@"GameScean/touchesBegan- ERROR invalid game state");
    }
    
}

-(void)removeChildChain:(SKNode *)targetNode{
    SKNode *tempNode = [[SKNode alloc]init];
    if (targetNode.children != NULL && targetNode.children.count != 0 ){
        NSLog(@"GameScene/removeChildChain- Target name: %@",targetNode.name);
        tempNode = targetNode.children[0];
        [self removeChildChain:tempNode];
        NSLog(@"GameScene/removeChildChain-removing from parent: %@",tempNode.name);
        [tempNode removeFromParent];
    }else{
        NSLog(@"child chain end: %@",targetNode.name);
    }
}



-(void)beginGame{
    self.gameState = 1;
    [self removeMessages];
    [self setCameraTracking:player];
    [self alterLevelAlpha:1 includeCamera:true];
    player.physicsBody.dynamic = true;
    [player moveXPositiveForever:1];
    
}

//altered update method adapted from source: https://www.raywenderlich.com/42699/spritekit-tutorial-for-beginners
- (void)update:(NSTimeInterval)currentTime {
    // Handle time delta.
    // If we drop below 60fps, we still want everything to move the same distance.
    CFTimeInterval timeSinceLast = currentTime - self.lastJumpUpdateTimeInterval;
    self.lastJumpUpdateTimeInterval = currentTime;
    if (timeSinceLast > 1) { // more than a second since last update
        timeSinceLast = 1.0 / 60.0;
        self.lastJumpUpdateTimeInterval = currentTime;
    }
    
    [self updateWithTimeSinceLastUpdate:timeSinceLast];
    
    if (player.isInAir == true){
        GameLabel *templbSKScore = (GameLabel *)[_nodeCamera childNodeWithName:@"lbSKScore"];
        [templbSKScore increaseScore];
    }
}

//updateWithTimeSinceLastUpdate source: https://www.raywenderlich.com/42699/spritekit-tutorial-for-beginners
- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLastJump {
    self.lastJumpTimeInterval += timeSinceLastJump;
    if (self.lastJumpTimeInterval > 1.5) {
        self.lastJumpTimeInterval = 0;
        player.cannotJump = false;
    }
}

-(void)didBeginContact:(SKPhysicsContact *)contact{
    NSLog(@"contact began");
    player.isInAir = false;
}

#pragma mark - Changing Game State

-(void)determinGameState{
    if (player.position.y < ground.position.y){
        self.gameState = 2;
        NSLog(@"GameScean/determinGameState- Game Over");
        NSLog(@"GameScean/touchesBegan- Player coord: ( %f, %f )",player.position.x, player.position.y);
        NSLog(@"GameScean/touchesBegan- Finish coord: ( %f, %f )",self.finishCoord.x, self.finishCoord.y);
        NSLog(@"GameScean/touchesBegan- fail Y cord: %f", ground.position.y);
        NSLog(@"test end");
        
        [self endGame];
    }else if(player.position.x > self.finishCoord.x) {
        self.gameState = 3;
        NSLog(@"GameScean/determinGameState- level complete");
        NSLog(@"GameScean/touchesBegan- Player coord: ( %f, %f )",player.position.x, player.position.y);
        NSLog(@"GameScean/touchesBegan- Finish coord: ( %f, %f )",self.finishCoord.x, self.finishCoord.y);
        NSLog(@"GameScean/touchesBegan- fail Y cord: %f", ground.position.y);
        NSLog(@"test end");
        if(self.currentLevel != self.levelData.levelsArray.count){
            NSLog(@"GameScean/determinGameState- incrementing current level");
            self.currentLevel++;
        }
        
        [self endGame];
        
    }else if( self.gameState == 4){
        NSLog(@"GameScean/determinGameState- paused");
        [self pauseGame];
        
    }else if (self.gameState> self.numGameState - 1){
        NSLog(@"GameScean/determinGameState- ERROR invalid game state");
    }
}

-(void)didSimulatePhysics{
    [self determinGameState];
}

-(void)pauseGame{
    self.gameState = 4;
    [player removeActionForKey:@"moveXPositiveForever"];
    player.physicsBody.dynamic = false;
    [self alterLevelAlpha:0.5 includeCamera:false];
}

-(void)endGame{
    NSLog(@"GameScean/determinGameState- EndingGame");
    player.isInAir = false;
    SKLabelNode *lbSKEndMessage = [GameLabel lbEndMsg:self.gameState font: self.Gamefont];
    [self resetStage];
    [self alterLevelAlpha:0.25 includeCamera:false];
    [_nodeCamera addChild:lbSKEndMessage];
}

-(void)resetStage{
    NSLog(@"GameScean/resetStage- Resetting Scene");
    [lbSKScore resetScore];
    player.physicsBody.dynamic = false;
    [player removeAllActions];
    [player removeActionForKey:@"moveXPositiveForever"];
    player.position = CGPointMake(0, 0);
    [self removeChildChain:ground];
    [ground removeAllChildren];
    [self loadLevel:self.currentLevel];
    self.gameState = 0;
}

-(void)alterLevelAlpha:(float)alpha includeCamera:(bool)includeCamera{
    //recursive function that iterates down child chain until final child then changes all nodes alpha to original input
    if (includeCamera  == false){
        [_nodeCamera moveToParent:self];
    }else if (includeCamera  == true){
        [_nodeCamera moveToParent:player];
    }
    player.alpha = alpha;
    ground.alpha = alpha;
}

-(void)removeMessages{
    [_nodeCamera removeAllChildren];
    [_nodeCamera addChild:lbSKScore];
}

    //test logs
    /*
     NSLog(@"GameViewController - ground (%.0f, %.0f)", ground.position.x, ground.position.y);
     NSLog(@"GameViewController - player node name: %@", player.name);
     */
    //testing code for game object placement
    /*
     NSLog(@"GameScene - fame height = %f",self.frame.size.height);
     NSLog(@"GameScene - fame width = %f",self.frame.size.width);
     
     CGRect screenSize = [[UIScreen mainScreen] bounds];
     NSLog(@"GameScene - screen height = %f",screenSize.size.height);
     NSLog(@"GameScene - screen width = %f",screenSize.size.width);
     
     SKSpriteNode *test0 = [SKSpriteNode spriteNodeWithColor: [UIColor greenColor] size:CGSizeMake(10, 10)];
     SKSpriteNode *test1 = [SKSpriteNode spriteNodeWithColor: [UIColor redColor] size:CGSizeMake(screenSize.size.width, 10)];
     SKSpriteNode *test2 = [SKSpriteNode spriteNodeWithColor: [UIColor yellowColor] size:CGSizeMake(10, screenSize.size.height)];
     SKSpriteNode *test3 = [SKSpriteNode spriteNodeWithColor: [UIColor blueColor] size:CGSizeMake(screenSize.size.width+100, 10)];
     
     
     test1.position = CGPointMake(0, 0);
     test2.position = CGPointMake(0, 0);
     test3.position = CGPointMake(0, -10);
     
     [self addChild:test0];
     [self addChild:test1];
     [self addChild:test2];
     [self addChild:test3];
     */

/*
//Defualt code
 SKShapeNode *_spinnyNode;
 SKLabelNode *_label;
 }
 
 - (void)didMoveToView:(SKView *)view {
 // Setup your scene here
 
 // Get label node from scene and store it for use later
 _label = (SKLabelNode *)[self childNodeWithName:@"//helloLabel"];
 
 _label.alpha = 0.0;
 [_label runAction:[SKAction fadeInWithDuration:2.0]];
 
 CGFloat w = (self.size.width + self.size.height) * 0.05;
 
 // Create shape node to use during mouse interaction
 _spinnyNode = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(w, w) cornerRadius:w * 0.3];
 _spinnyNode.lineWidth = 2.5;
 
 [_spinnyNode runAction:[SKAction repeatActionForever:[SKAction rotateByAngle:M_PI duration:1]]];
 [_spinnyNode runAction:[SKAction sequence:@[
 [SKAction waitForDuration:0.5],
 [SKAction fadeOutWithDuration:0.5],
 [SKAction removeFromParent],
 ]]];
 }
 
 
 - (void)touchDownAtPoint:(CGPoint)pos {
 SKShapeNode *n = [_spinnyNode copy];
 n.position = pos;
 n.strokeColor = [SKColor greenColor];
 [self addChild:n];
 }
 
 - (void)touchMovedToPoint:(CGPoint)pos {
 SKShapeNode *n = [_spinnyNode copy];
 n.position = pos;
 n.strokeColor = [SKColor blueColor];
 [self addChild:n];
 }
 
 - (void)touchUpAtPoint:(CGPoint)pos {
 SKShapeNode *n = [_spinnyNode copy];
 n.position = pos;
 n.strokeColor = [SKColor redColor];
 [self addChild:n];
 }
 
 - (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
 // Run 'Pulse' action from 'Actions.sks'
 [_label runAction:[SKAction actionNamed:@"Pulse"] withKey:@"fadeInOut"];
 
 for (UITouch *t in touches) {[self touchDownAtPoint:[t locationInNode:self]];}
 }
 - (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
 for (UITouch *t in touches) {[self touchMovedToPoint:[t locationInNode:self]];}
 }
 - (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
 for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
 }
 - (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
 for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
 }
 
 
 -(void)update:(CFTimeInterval)currentTime {
 // Called before each frame is rendered
 }

*/


@end
