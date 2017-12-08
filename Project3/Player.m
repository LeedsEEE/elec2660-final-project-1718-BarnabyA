//
//  Player.m
//  Project3
//
//  Created by Barnaby Ayriss [el16ba] on 24/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Player.h"

@interface Player()

@property CGPoint jumpStartCoord;

@end

@implementation Player

static const uint32_t bitMaskCategoryPlayer = 0x1 << 0;
static const uint32_t bitMaskCategoryGameObject = 0x1 << 1;

+(id)player
{
    //Creates the player with defualt values
    Player *player = [Player spriteNodeWithColor:[UIColor orangeColor] size:CGSizeMake(50, 50)];
    SKSpriteNode *jetPackMain = [SKSpriteNode spriteNodeWithColor:[UIColor grayColor] size:CGSizeMake(10,(player.size.height/2))];
    SKSpriteNode *jetPackFire = [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:CGSizeMake(10, player.size.height/2)];
    
    //Sets the players defualt physics values
    player.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:player.size];
    player.physicsBody.dynamic = true;
    player.physicsBody.allowsRotation = false;
    player.physicsBody.categoryBitMask = bitMaskCategoryPlayer;
    player.physicsBody.contactTestBitMask = bitMaskCategoryGameObject;
    
    //Sets the jetPackMain deualt values
    jetPackMain.position = CGPointMake(-player.size.width/2 - jetPackMain.size.width/2, player.size.height/2 - jetPackMain.size.height/2);
    //Sets the jetPackFire defualt values
    jetPackFire.position = CGPointMake(-player.size.width/2 - jetPackFire.size.width/2, -jetPackFire.size.height/2);
    jetPackFire.name = @"jetPackFire";
    jetPackFire.alpha = 0;
    
    //Adds jetPackNodes to player so they will follow the player
    [player addChild:jetPackMain];
    [player addChild:jetPackFire];
    
    return player;
}

-(void)moveXPositiveForever:(float)speed
{
    //Runs an Skaction to move the player to the right
    SKAction *moveXPositiveForever = [SKAction repeatActionForever:[SKAction moveBy:CGVectorMake(speed, 0) duration:0.01]];
    [self runAction:moveXPositiveForever withKey:@"moveXPositiveForever"];
}

-(void)jump:(CGVector)gravity
{
    //Causes the player to jump when allowed to and runs the appropriate animations
    CGVector jumpForce = CGVectorMake(gravity.dx, -gravity.dy*(120/9.8));
    float forceDuration = 0.5;
    SKAction *jump = [SKAction applyImpulse:jumpForce duration: forceDuration];
    if (self.cannotJump == false) {
        [self runAction:jump];
        [self displayJetpackFire:forceDuration];
        self.cannotJump = true;
        self.isInAir = true;
        NSLog(@"Player/jump- jump impulse of %0.f applied",jumpForce.dy);
        
    }
}
-(void)pause{
    //Stops player movement and point aquesition
    self.physicsBody.dynamic = false;
    self.isInAir = false;
    [self removeActionForKey:@"moveXPositiveForever"];
}

-(void)displayJetpackFire:(NSTimeInterval)duration{
    //jetPackFlame animations
    SKAction *wait = [SKAction waitForDuration:duration];
    SKAction *fade = [SKAction fadeOutWithDuration:0.5];
    SKSpriteNode *tempJetPackFire = (SKSpriteNode *)[self childNodeWithName:@"jetPackFire"];
    
    tempJetPackFire.alpha = 1;
    [tempJetPackFire runAction:wait];
    [tempJetPackFire runAction:fade];
    
}



@end
