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

-(void)moveXPositive:(float)speed
{
    SKAction *moveXPositive = [SKAction moveBy:CGVectorMake(speed, 0) duration:0];
    [self runAction:moveXPositive];
}

-(void)jump
{
        SKAction *jump = [SKAction applyForce:CGVectorMake(0,300) duration:0.5];
        [self runAction:jump];
        NSLog(@"Jump");
}
@end
