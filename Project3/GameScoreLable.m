//
//  GameScoreLable.m
//  Project3
//
//  Created by Barnaby Ayriss on 04/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "GameScoreLable.h"

@implementation GameScoreLable

+(SKLabelNode *)lbScore: (NSString *)font{
    SKLabelNode *lable = [[SKLabelNode alloc] init];
    lable.fontName = font;
    lable.text = @"Score: ";
    return lable;
}


@end
