//
//  GameScoreLable.m
//  Project3
//
//  Created by Barnaby Ayriss on 04/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "GameScoreLabel.h"

@implementation GameScoreLabel

+(id)lbScore: (NSString *)font{
    GameScoreLabel *label = [[GameScoreLabel alloc] init];
    label.fontName = font;
    label.currentScore = 0;
    label.text = [NSString stringWithFormat:@"Score %i",label.currentScore];
    return label;
}

-(void)increaseScore{
    self.currentScore++;
    self.text = [NSString stringWithFormat:@"Score %i",self.currentScore];
}


@end
