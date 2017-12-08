//
//  GameScoreLable.m
//  Project3
//
//  Created by Barnaby Ayriss on 04/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

//Used as geneeral referance throughout project:https://www.youtube.com/watch?v=CWZgt8a7a-k&list=PL1YTxp2xLtqSn5-KEUKDoMPLd0uZ0oV-3


#import "GameLabel.h"

@implementation GameLabel

+(id)lbScore: (NSString *)font{
    //Creates the score counter in the game
    GameLabel *label = [[GameLabel alloc] init];
    label.fontName = font;
    label.currentScore = 0;
    label.text = [NSString stringWithFormat:@"Score: %i",label.currentScore];
    return label;
}

+(id)lbEndMsg:(int)gameState font:(NSString *)font{
    //Creates the end messages for failing and completing a level
    SKLabelNode *endMsg = [[SKLabelNode alloc]init];
    endMsg.fontName = font;
    endMsg.fontSize = 42;
    endMsg.alpha = 1;
    if (gameState  == 3) {
        endMsg.text = @"Level complete tap to advance";
    }else if(gameState == 2){
        endMsg.text = @"Level Failed, tap to try again";
    }
    return endMsg;
}

+(id)lbCompleteMsg:(NSString *)font score:(int)score{
    //creates the completion message fro completing the game
    //completeMsg2 is added to give the message 2 lines to write on
    SKLabelNode *completeMsg = [[SKLabelNode alloc]init];
    SKLabelNode *completeMsg2 = [[SKLabelNode alloc]init];
    
    completeMsg.fontName = font;
    completeMsg.fontSize = 42;
    completeMsg.alpha = 1;
    completeMsg.name = @"completeMsg";
    
    completeMsg2.fontName = font;
    completeMsg2.fontSize = 42;
    completeMsg2.alpha = 1;
    completeMsg2.position = CGPointMake(0,-completeMsg.fontSize);
    completeMsg2.name = @"completeMsg2";

    completeMsg.text = @"Well Done!! you completed the game";
    completeMsg2.text = [NSString stringWithFormat:@"Your score was: %i",score];
    

    [completeMsg addChild:completeMsg2];
    
    return completeMsg;
}

-(void)updateScore:(int)Score{
    //updates the score lable for carrying over scores between levels
    self.currentScore = Score;
    self.text = [NSString stringWithFormat:@"Score: %i",self.currentScore];
}

-(void)increaseScore{
    //updates the score label to increase the score
    self.currentScore++;
    self.text = [NSString stringWithFormat:@"Score: %i",self.currentScore];
}

-(void)resetScore{
    //sets the score lable to zero
    self.currentScore = 0;
    self.text = [NSString stringWithFormat:@"Score: %i",self.currentScore];
}
@end
