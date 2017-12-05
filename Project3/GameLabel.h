//
//  GameScoreLable.h
//  Project3
//
//  Created by Barnaby Ayriss on 04/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameLabel : SKLabelNode

@property int currentScore;

+(id)lbScore: (NSString*)font;
+(id)lbEndMsg:(int)gameState font:(NSString *)font;
+(id)lbCompleteMsg:(NSString *)font;
-(void) increaseScore;
-(void)resetScore;
@end
