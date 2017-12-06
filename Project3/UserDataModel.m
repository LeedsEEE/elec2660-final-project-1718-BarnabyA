//
//  UserDataModel.m
//  Project3
//
//  Created by Barnaby Ayriss on 06/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "UserDataModel.h"

@implementation UserDataModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [super init];
        self.settings = [[Settings alloc]init];
        self.settings.difficulty = 1.5;
        self.settings.music = true;
        self.settings.SFX = true;
        self.highScore = 0;
    }
    return self;
}
@end
