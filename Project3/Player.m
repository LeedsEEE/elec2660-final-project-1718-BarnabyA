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

-(void)moveXPositive
{
    SKAction *moveXPositive = [SKAction moveBy:CGVectorMake(10, 0) duration:0];
    [self runAction:moveXPositive];
    NSLog(@"Player/moveXPositive- func ran");
}
@end
