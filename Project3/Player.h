//
//  Player.h
//  Project3
//
//  Created by Barnaby Ayriss [el16ba] on 24/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameLabel.h"

@interface Player : SKSpriteNode

@property bool cannotJump;
@property bool isInAir;

+(id)player;

-(void)moveXPositiveForever:(float)speed;
-(void)jump:(CGVector)gravity;
-(void)pause;

@end
