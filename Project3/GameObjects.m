//
//  GameObjects.m
//  Project3
//
//  Created by Barnaby Ayriss [el16ba] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "GameObjects.h"

@implementation GameObjects

static const uint32_t bitMaskCategorygameObject = 0x1 << 1;

+(id)platform
{
    GameObjects *platform = [GameObjects spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(100, 100)];
    platform.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:platform.size];
    platform.physicsBody.dynamic = false;
    platform.physicsBody.categoryBitMask = bitMaskCategorygameObject;
    NSLog(@"GameObjects - platform created");
    return platform;
}




@end
