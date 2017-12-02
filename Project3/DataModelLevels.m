//
//  DataModeLevels.m
//  Project3
//
//  Created by Barnaby Ayriss on 29/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DataModelLevels.h"

@interface DataModelLevels()

@property (strong, nonatomic) Level *level1;
@end


@implementation DataModelLevels

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"DataModelLevels/init- Loading Levels");
        Level *level1 = [self loadLevel1];
        [self.levelsArray addObject:level1];
        
    }
    return self;
}

-(Level *) loadLevel1{
    //creation of temporary variables
    Level *level1;
    float coordX[level1.numGameObjects];
    float coordY[level1.numGameObjects];
    NSMutableArray *tempXCoord;
    NSMutableArray *tempYCoord;
    
    //Sets Level properties
    level1.numGameObjects = 5;
    level1.colour = [UIColor blueColor];
    
    //Loading gameObject Posisitons
    //for loop here as place holder for loading function
    for (int x = 0; x < level1.numGameObjects; x += 1){
        coordX[x] = 100;
        for (int y = 0; y < level1.numGameObjects; y++) {
            coordY[y] = 100;
        }
    }
    
    //converting stored coordinates into NSMutableArrays
    for (int x = 0; x < level1.numGameObjects; x += 1){
        [tempXCoord addObject:[NSNumber numberWithFloat:coordX[x]]];
        for (int y = 0; y < level1.numGameObjects; y++) {
            [tempYCoord addObject:[NSNumber numberWithFloat:coordY[y]]];
        }
    }
    //loading stored cordinates into level1
    level1.gameObjectsXCoord = tempXCoord;
    level1.gameObjectsYCoord = tempYCoord;
    [level1 generateGameObjects];
    return level1;
}
@end
