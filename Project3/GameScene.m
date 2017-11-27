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
}

- (void)didMoveToView:(SKView *)view {
    // Setting up Scene
    
    
    _nodeCamera = (SKCameraNode *)[self childNodeWithName:@"nodeCamera"];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    NSLog(@"GameScean - ScreenRect = %.2f, %.2f", screenRect.size.width,screenRect.size.height);
    self.anchorPoint = CGPointMake(0.5, 0.5);
    
    
    //Creating nodes in scene
    ground = [GameObjects platform];
    player = [Player player];
    
    
    //setting node names
    ground.name = @"ground";
    player.name = @"player";
    
    //setting node sizes
    
    //ground.size = CGSizeMake(screenRect.size.width,20);
    
    ground.size = CGSizeMake(self.frame.size.width,30);
    
    //setting start positions of nodes
    
    NSLog(@"GameScean/didMoveToView- frame %.0f,%0.f", self.frame.size.width,self.frame.size.height);
    
    ground.position = CGPointMake(0, -player.size.height/2 - ground.size.height/2);
    
    //setting physics of nodes
    ground.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ground.size];
    ground.physicsBody.dynamic = false;
    player.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:player.size];
    player.physicsBody.dynamic = true;
    
    //adding nodes to view
    [self addChild:player];
    NSLog(@"GameScean/didMoveToView- player node added");
    [self addChild:ground];
    NSLog(@"GameScean/didMoveToView- ground node added");
    
    //locks camera to track player sprite
    [_nodeCamera moveToParent:player];

    
    _nodeCamera.position = CGPointMake(_nodeCamera.parent.position.x + self.frame.size.width/3,ground.position.y + self.frame.size.height/2 - ground.size.height/2);
    //_nodeCamera.parent.position.y + self.frame.size.height/2 - player.size.height - ground.size.height
}
    
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    //moves player to the right when screen is touched
    Player *playerTemp = (Player *)[self childNodeWithName:@"player"];
    [playerTemp moveXPositive];

}

-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
    //Player *playerTemp = (Player *)[self childNodeWithName:@"player"];
    //self.camera.position = playerTemp.position;
    
}

-(void)didSimulatePhysics
{
    _nodeCamera.position = CGPointMake(_nodeCamera.parent.position.x + self.frame.size.width/3,ground.position.y + self.frame.size.height/2 - ground.size.height/2);
}


/*
-(void)centerOnNode:(SKNode *)node
{
    CGPoint positionInScene = [self convertPoint:node.position fromNode:node.parent];
    _testCam.position = CGPointMake(_testCam.position.x - positionInScene.x, _testCam.position.y - positionInScene.y);
}
*/
    
    
    
    
    
    
    
    
    
    
    
    

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
  */
























//Defualt code
/*
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
