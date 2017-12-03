//
//  DataModeLevels.m
//  Project3
//
//  Created by Barnaby Ayriss on 29/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DataModelLevels.h"

@interface DataModelLevels()

@end

@implementation DataModelLevels

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"DataModelLevels/init- Running");
        self.levelsArray = [[NSMutableArray alloc] init];
        Level *level1 = [self loadLevel1];
        [self.levelsArray addObject:level1];
        NSLog(@"DataModelLevels/init- number of levels: %lu", self.levelsArray.count);
    }
    return self;
}

-(Level *) loadLevel1{
    //creation of temporary variables
    NSLog(@"DataModelLevels/loadLevel1- loading Level1");
    Level *level1 = [[Level alloc] init];
    float coordX[level1.numGameObjects];
    float coordY[level1.numGameObjects];
    NSNumber *tempNSNumber;
    NSMutableArray *tempXCoord = [[NSMutableArray alloc] init];
    NSMutableArray *tempYCoord = [[NSMutableArray alloc] init];
    
    //Sets Level properties
    level1.numGameObjects = 5;
    level1.colour = [UIColor blueColor];
    
    //Loading gameObject Posisitons
    //for loop here as place holder for loading function
    
    NSLog(@"DataModelLevels/loadLevel1- loading %i gameObjects", level1.numGameObjects);
    for (int x = 0; x < level1.numGameObjects; x += 1){
        coordX[x] = 100;
        for (int y = 0; y < level1.numGameObjects; y++) {
            coordY[y] = 100;
        }
    }
    //converting stored coordinates into NSMutableArrays
    for (int x = 0; x < level1.numGameObjects; x += 1){
        tempNSNumber = [NSNumber numberWithFloat:coordX[x]];
        [tempXCoord addObject:tempNSNumber];
        for (int y = 0; y < level1.numGameObjects; y++) {
            tempNSNumber = [NSNumber numberWithFloat:coordY[y]];
            [tempYCoord addObject:tempNSNumber];
        }
    }
    //loading stored cordinates into level1
    level1.gameObjectsXCoord = tempXCoord;
    level1.gameObjectsYCoord = tempYCoord;
    [level1 generateGameObjects];
    GameObjects *test;
    test = [level1.gameObjectsArray objectAtIndex:0];
    NSLog(@"%@", test.name);
    return level1;
}
@end
