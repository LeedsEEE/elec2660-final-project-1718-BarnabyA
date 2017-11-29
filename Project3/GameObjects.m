//
//  GameObjects.m
//  Project3
//
//  Created by Barnaby Ayriss [el16ba] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "GameObjects.h"

@implementation GameObjects


+(id)platform
{
    GameObjects *platform = [GameObjects spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(100, 100)];
    platform.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:platform.size];
    platform.physicsBody.dynamic = NO;
    
    NSLog(@"GameObjects - platforms defined");
    return platform;
}




@end
