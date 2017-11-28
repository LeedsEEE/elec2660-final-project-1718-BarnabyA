//
//  Player.h
//  Project3
//
//  Created by Barnaby Ayriss [el16ba] on 24/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Player : SKSpriteNode

//@property Ismoving:bool;

+(id)player;

-(void)moveXPositiveForever:(float)speed;
-(void)jump;

@end
