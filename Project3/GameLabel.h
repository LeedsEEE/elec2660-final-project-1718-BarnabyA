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

+(id)lbScore: (NSString*)font;                          //Creates the score label
+(id)lbEndMsg:(int)gameState font:(NSString *)font;     //Creates the end of level messages
+(id)lbCompleteMsg:(NSString *)font score:(int)score;   //Creates the complete game messages
-(void)updateScore:(int)Score;                          //updates thye score label
-(void)increaseScore;                                   //Increments the score
-(void)resetScore;                                      //Resets the score lable
@end
