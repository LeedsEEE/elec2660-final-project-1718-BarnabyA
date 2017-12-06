//
//  UserDataModel.h
//  Project3
//
//  Created by Barnaby Ayriss on 06/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Settings.h"

@interface UserDataModel : NSObject

@property int highScore;
@property (strong, nonatomic)Settings *settings;

-(UserDataModel *)init;

@end
