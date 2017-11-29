//
//  DataModeLevels.h
//  Project3
//
//  Created by Barnaby Ayriss on 29/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"

@interface DataModelLevels : NSObject

+(id)level1;

@property (strong,nonatomic) NSMutableArray * levelsArray;  // holds arays of the levels

@end
