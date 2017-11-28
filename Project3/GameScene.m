//
//  GameScene.m
//  Project3
//
//  Created by Barnaby Ayriss [el16ba] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene {
    //Defining nodes in scene
    GameObjects *ground;
    Player *player;
    SKCameraNode *_nodeCamera;
    int GameState;
    /* Game state
        0: Not Started
        1: Started
        2: End Fail
    */
}

- (void)didMoveToView:(SKView *)view {
    [self initialize];
    [self loadTestLevel];

}

-(void)initialize{
    NSLog(@"GameScean/initialize- frame sizes %.0f,%0.f", self.frame.size.width,self.frame.size.height);
    
    //getting camera node from sks scene
    _nodeCamera = (SKCameraNode *)[self childNodeWithName:@"nodeCamera"];
    
    //setting refence point for drawing other nodes
    self.anchorPoint = CGPointMake(0.5, 0.5);
    
    //Creating instances of nodes in scene
    ground = [GameObjects platform];
    player = [Player player];
    NSLog(@"GameScean/initialize- gameplay nodes instances created");
    
    //setting node names
    ground.name = @"ground";
    player.name = @"player";
    NSLog(@"GameScean/initialize- gameplay node's named");
    
    //setting node sizes
    ground.size = CGSizeMake(self.frame.size.width,30);
    
    NSLog(@"GameScean/initialize- gameplay node's sizes set");
    
    //setting start positions of nodes
    ground.position = CGPointMake(0, -player.size.height/2 - ground.size.height/2);
    NSLog(@"GameScean/initialize- gameplay node's starting positions");
    
    //setting physics of nodes
    ground.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ground.size];
    ground.physicsBody.dynamic = false;
    NSLog(@"GameScean/initialize- gameplay node physics set");
    
    player.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:player.size];
    player.physicsBody.dynamic = true;
    player.physicsBody.allowsRotation = false;
    NSLog(@"GameScean/initialize- player node physics set");
    
    //adding nodes to view
    [self addChild:player];
    NSLog(@"GameScean/initialize- player node added to frame");
    [self addChild:ground];
    NSLog(@"GameScean/initialize- ground node added to frame");
    
    
    //locks camera to track player sprite by assiging player as its parent node
    [_nodeCamera moveToParent:player];
    NSLog(@"GameScean/initialize- Camera tracking set");
    _nodeCamera.position = CGPointMake(_nodeCamera.parent.position.x + self.frame.size.width/3, ground.position.y);
    NSLog(@"GameScean/initialize- Camera position set");
    
    //Begins the players movement through the level with a set speed
    
}
-(void)loadTestLevel{
    //loades a basic level for testing
    
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


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //Causes player to jump when screen is touched
    Player *playerTemp = (Player *)[self childNodeWithName:@"player"];
    
    if(GameState == 0){
        NSLog(@"GameScean/touchesBegan- Game start");
        [playerTemp moveXPositiveForever:1];
        GameState = 1;
    } else if (GameState == 1){
        NSLog(@"GameScean/touchesBegan- Jump");
        [playerTemp jump];
    }else if (GameState > 1){
        NSLog(@"GameScean/touchesBegan- ERROR invalid game state");
    }
    
}

-(void)update:(CFTimeInterval)currentTime {
    
}

-(void)clearStage{
    NSLog(@"claerStage");
}

-(void)endGame{
    NSLog(@"endGame");
}
-(void)didSimulatePhysics
{

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
