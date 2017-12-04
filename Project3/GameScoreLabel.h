//
//  GameScoreLable.h
//  Project3
//
//  Created by Barnaby Ayriss on 04/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameScoreLabel : SKLabelNode

@property int currentScore;

+(SKLabelNode *)lbScore: (NSString*)font;

-(void) increaseScore;

@end
