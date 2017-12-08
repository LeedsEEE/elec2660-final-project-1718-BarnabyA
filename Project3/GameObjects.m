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
    //creates deualt platfrom GameObject
    GameObjects *object = [GameObjects spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(150, 30)];
    object.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:object.size];
    object.physicsBody.dynamic = false;
    object.physicsBody.categoryBitMask = bitMaskCategorygameObject;
    NSLog(@"GameObjects - platform created");
    return object;
}

+(id)wall
{
    //creates deualt platfrom GameObject
    GameObjects *object = [GameObjects spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(30, 150)];
    object.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:object.size];
    object.physicsBody.dynamic = false;
    object.physicsBody.categoryBitMask = bitMaskCategorygameObject;
    NSLog(@"GameObjects - wall created");
    return object;
}

@end
