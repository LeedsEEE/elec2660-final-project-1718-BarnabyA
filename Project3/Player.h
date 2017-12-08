//
//  Player.h
//  Project3
//
//  Created by Barnaby Ayriss [el16ba] on 24/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Player : SKSpriteNode

@property bool cannotJump;   //used to cheeck if player can jump at the present time
@property bool isInAir;      //used to check if player should be reciving points

+(id)player; //creates the player with deualt properties

-(void)moveXPositiveForever:(float)speed;               //sets the player moving to the right
-(void)jump:(CGVector)gravity;                          //causes the player to jump
-(void)pause;                                           //pauses the players movement and score aqusition
-(void)displayJetpackFire:(NSTimeInterval)duration;     //creates and removes the jetpack flame duting jump animation

@end
