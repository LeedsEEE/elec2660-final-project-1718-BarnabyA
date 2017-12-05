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
        NSLog(@"DataModelLevels/init- initializing data model levels");
        self.levelsArray = [[NSMutableArray alloc] init];
        Level *level1 = [self loadLevel1];
        Level *level2 = [self loadLevel2];
        Level *level3 = [self loadLevel3];

        [self.levelsArray addObject:level1];
        [self.levelsArray addObject:level2];
        [self.levelsArray addObject:level3];
        NSLog(@"DataModelLevels/init- number of levels: %lu", self.levelsArray.count);
    }
    return self;
}

-(Level *) loadLevel1{
    //creation of temporary variables
    NSLog(@"DataModelLevels/loadLevel1- Preloading Level1");
    Level *level = [[Level alloc] init];
    level.numGameObjects = 5;
    level.colour = [UIColor blueColor];
    GameObjects *tempGameObject = [GameObjects platform];
    
    float coordX[level.numGameObjects];
    float coordY[level.numGameObjects];
    NSNumber *tempNSNumber;
    NSMutableArray *tempXCoord = [[NSMutableArray alloc] init];
    NSMutableArray *tempYCoord = [[NSMutableArray alloc] init];
    
    //Sets Level properties
    
    
    //Loading gameObject Posisitons
    //for loop here as place holder for loading function
    
    NSLog(@"DataModelLevels/loadLevel1- loading %i gameObjects", level.numGameObjects);
    for (int x = 0; x < level.numGameObjects; x += 1){
        coordX[x] = 100 + tempGameObject.size.width/2;
        for (int y = 0; y < level.numGameObjects; y++) {
            coordY[y] = 100;
        }
    }
    //converting stored coordinates into NSMutableArrays
    for (int x = 0; x < level.numGameObjects; x += 1){
        tempNSNumber = [NSNumber numberWithFloat:coordX[x]];
        [tempXCoord addObject:tempNSNumber];
        for (int y = 0; y < level.numGameObjects; y++) {
            tempNSNumber = [NSNumber numberWithFloat:coordY[y]];
            [tempYCoord addObject:tempNSNumber];
        }
    }
    //loading stored cordinates into level1
    level.gameObjectsXCoord = tempXCoord;
    level.gameObjectsYCoord = tempYCoord;
    [level generateGameObjects];
    return level;
}

-(Level *) loadLevel2{
    //creation of temporary variables
    NSLog(@"DataModelLevels/loadLevel1- Preloading Level2");
    Level *level = [[Level alloc] init];
    level.numGameObjects = 11;
    level.colour = [UIColor yellowColor];
    GameObjects *tempGameObject = [GameObjects platform];
    
    float coordX[level.numGameObjects];
    float coordY[level.numGameObjects];
    NSNumber *tempNSNumber;
    NSMutableArray *tempXCoord = [[NSMutableArray alloc] init];
    NSMutableArray *tempYCoord = [[NSMutableArray alloc] init];
    
    //Sets Level properties
    
    
    //Loading gameObject Posisitons
    //for loop here as place holder for loading function
    
    NSLog(@"DataModelLevels/loadLevel2- loading %i gameObjects", level.numGameObjects);
    for (int x = 0; x < level.numGameObjects; x++){
        coordX[x] = 100 + tempGameObject.size.width;
        for (int y = 0; y < level.numGameObjects; y++) {
            
            if(y % 2 == 0){
                coordY[y] = 100;
            }else{
                coordY[y] = -100;
            }
        }
    }
    //converting stored coordinates into NSMutableArrays
    for (int x = 0; x < level.numGameObjects; x++){
        tempNSNumber = [NSNumber numberWithFloat:coordX[x]];
        [tempXCoord addObject:tempNSNumber];
        for (int y = 0; y < level.numGameObjects; y++) {
            tempNSNumber = [NSNumber numberWithFloat:coordY[y]];
            [tempYCoord addObject:tempNSNumber];
        }
    }
    //loading stored cordinates into level1
    level.gameObjectsXCoord = tempXCoord;
    level.gameObjectsYCoord = tempYCoord;
    [level generateGameObjects];
    
    return level;
}

-(Level *) loadLevel3{
    //creation of temporary variables
    NSLog(@"DataModelLevels/loadLevel1- Preloading Level1");
    Level *level = [[Level alloc] init];
    level.numGameObjects = 5;
    level.colour = [UIColor brownColor];
    GameObjects *tempGameObject = [GameObjects platform];
    
    float coordX[level.numGameObjects];
    float coordY[level.numGameObjects];
    NSNumber *tempNSNumber;
    NSMutableArray *tempXCoord = [[NSMutableArray alloc] init];
    NSMutableArray *tempYCoord = [[NSMutableArray alloc] init];
    
    //Sets Level properties
    
    
    //Loading gameObject Posisitons
    //for loop here as place holder for loading function
    
    NSLog(@"DataModelLevels/loadLevel1- loading %i gameObjects", level.numGameObjects);
    for (int x = 0; x < level.numGameObjects; x += 1){
        coordX[x] = 100 + tempGameObject.size.width/2;
        for (int y = 0; y < level.numGameObjects; y++) {
            if (y % 2 == 0){
                coordY[y] = 100;
            }else{
                coordY[y] = 0;
            }
            
            
        }
    }
    //converting stored coordinates into NSMutableArrays
    for (int x = 0; x < level.numGameObjects; x += 1){
        tempNSNumber = [NSNumber numberWithFloat:coordX[x]];
        [tempXCoord addObject:tempNSNumber];
        for (int y = 0; y < level.numGameObjects; y++) {
            tempNSNumber = [NSNumber numberWithFloat:coordY[y]];
            [tempYCoord addObject:tempNSNumber];
        }
    }
    //loading stored cordinates into level1
    level.gameObjectsXCoord = tempXCoord;
    level.gameObjectsYCoord = tempYCoord;
    [level generateGameObjects];
    return level;
}
@end

