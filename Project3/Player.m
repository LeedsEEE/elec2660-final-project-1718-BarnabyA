//
//  Player.m
//  Project3
//
//  Created by Barnaby Ayriss [el16ba] on 24/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Player.h"

@implementation Player


+(id)player

{
    Player *player = [Player spriteNodeWithColor:[UIColor orangeColor] size:CGSizeMake(50, 50)];
    return player;
}

-(void)moveXPositiveForever:(float)speed
{
    SKAction *moveXPositiveForever = [SKAction repeatActionForever:[SKAction moveBy:CGVectorMake(speed, 0) duration:0.01]];
    [self runAction:moveXPositiveForever];
}

-(void)jump
{
        //SKAction *jump = [SKAction applyForce:CGVectorMake(0,300) duration:0.5];
        SKAction *jump = [SKAction applyImpulse:CGVectorMake(0,120) duration: 0.5];
        [self runAction:jump];
        NSLog(@"Player/jump- jump impulse of 120 applied");
}
@end
