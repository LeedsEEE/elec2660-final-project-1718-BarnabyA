//
//  GameScoreLable.m
//  Project3
//
//  Created by Barnaby Ayriss on 04/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "GameLabel.h"

@implementation GameLabel

+(id)lbScore: (NSString *)font{
    GameLabel *label = [[GameLabel alloc] init];
    label.fontName = font;
    label.currentScore = 0;
    label.text = [NSString stringWithFormat:@"Score: %i",label.currentScore];
    return label;
}

+(id)lbEndMsg:(int)gameState font:(NSString *)font{
    SKLabelNode *endMsg = [[SKLabelNode alloc]init];
    endMsg.fontName = font;
    endMsg.fontSize = 42;
    endMsg.alpha = 1;
    if (gameState  == 3) {
        endMsg.text = @"Level complete tap to advance";
    }else if(gameState == 2){
        endMsg.text = @"Game Over";
    }
    return endMsg;
}

-(void)increaseScore{
    self.currentScore++;
    self.text = [NSString stringWithFormat:@"Score: %i",self.currentScore];
}

-(void)resetScore{
    self.currentScore = 0;
    self.text = [NSString stringWithFormat:@"Score: %i",self.currentScore];
}
@end
