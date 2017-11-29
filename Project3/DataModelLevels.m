//
//  DataModeLevels.m
//  Project3
//
//  Created by Barnaby Ayriss on 29/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DataModelLevels.h"

@implementation DataModelLevels

+(id)level1{
    Level *level1 = [Level init];
    level1.colour = [UIColor yellowColor];
    level1.numGameObjects = 10;
    level1.gameObjectsArray = [level1 generateGameObjects];
    //level1.gameObjectsArray = [DataModelLevels GeneratePlatforms:level1.colour];

    return level1;
}

@end
