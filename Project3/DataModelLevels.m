//
//  DataModeLevels.m
//  Project3
//
//  Created by Barnaby Ayriss on 29/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DataModelLevels.h"

@implementation DataModelLevels

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"DataModelLevels/init- initializing data model levels");
        self.levelsArray = [[NSMutableArray alloc] init];

        [self.levelsArray addObject:[self loadLevel1]];
        [self.levelsArray addObject:[self loadLevel2]];
        [self.levelsArray addObject:[self loadLevel3]];
        [self.levelsArray addObject:[self loadLevel4]];
        NSLog(@"DataModelLevels/init- number of levels: %lu", self.levelsArray.count);
    }
    return self;
}

-(Level *) loadLevel1{
    //creation of temporary variables
    NSLog(@"DataModelLevels/loadLevel1- Preloading Level1");
    Level *level = [[Level alloc] init];
    level.numGameObjects = 4;
    level.colour = [UIColor purpleColor];
    GameObjects *tempGameObject = [GameObjects platform];
    
    float coordX[level.numGameObjects];
    float coordY[level.numGameObjects];
    NSNumber *tempNSNumber;
    NSMutableArray *tempXCoord = [[NSMutableArray alloc] init];
    NSMutableArray *tempYCoord = [[NSMutableArray alloc] init];
    
    //Loading gameObject Posisitons
    NSLog(@"DataModelLevels/loadLevel1- loading %i gameObjects", level.numGameObjects);
    for (int x = 0; x < level.numGameObjects; x += 1){
        coordX[x] = 100 + tempGameObject.size.width/2;
        for (int y = 0; y < level.numGameObjects; y++) {
            coordY[y] = 100;
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
    
    //Loading gameObject Posisitons
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
    //loading stored cordinates into level2
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
    NSLog(@"DataModelLevels/loadLevel1- loading %i gameObjects", level.numGameObjects);
    for (int x = 0; x < level.numGameObjects; x++){
        coordX[x] = 100 + tempGameObject.size.width;
        for (int y = 0; y < level.numGameObjects; y++) {
            if (y % 2 == 0){
                coordY[y] = 100;
            }else{
                coordY[y] = 0;
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
    //loading stored cordinates into level3
    level.gameObjectsXCoord = tempXCoord;
    level.gameObjectsYCoord = tempYCoord;
    [level generateGameObjects];
    return level;
}

-(Level *) loadLevel4{
    //creation of temporary variables
    NSLog(@"DataModelLevels/loadLevel1- Preloading Level1");
    Level *level = [[Level alloc] init];
    level.numGameObjects = 10;
    level.colour = [UIColor colorWithRed:64.0/255.0 green:224.0/255.0 blue:208.0/255.0 alpha:1];
    GameObjects *tempGameObject = [GameObjects platform];
    GameObjects *tempWall = [GameObjects wall];
    
    float coordX[level.numGameObjects];
    float coordY[level.numGameObjects];
    NSNumber *tempNSNumber;
    NSMutableArray *tempXCoord = [[NSMutableArray alloc] init];
    NSMutableArray *tempYCoord = [[NSMutableArray alloc] init];
    
    //Sets Level properties
    
    //Loading gameObject Posisitons
    NSLog(@"DataModelLevels/loadLevel1- loading %i gameObjects", level.numGameObjects);
    
    for (int x = 0; x < 4; x ++){
        coordX[x] = 100 + tempGameObject.size.width/2;
        for (int y = 0; y < 4; y++) {
            coordY[y] = 100;
        }
    }
    coordX[4] = tempGameObject.size.width*2 + 25;
    coordY[4] = 100;
    coordX[5] = 0;
    coordY[5] = -150;
    coordX[6] = tempGameObject.size.width*2;
    coordY[6] = 75;
    coordX[7] = 200;
    coordY[7] = -300;
    coordX[8] = 100 + tempGameObject.size.width/2;
    coordY[8] = 0;
    coordX[9] =100 + tempGameObject.size.width/2;
    coordY[9] = 0;
    
    //converting stored coordinates into NSMutableArrays
    for (int x = 0; x < level.numGameObjects; x++){
        tempNSNumber = [NSNumber numberWithFloat:coordX[x]];
        [tempXCoord addObject:tempNSNumber];
        for (int y = 0; y < level.numGameObjects; y++) {
            tempNSNumber = [NSNumber numberWithFloat:coordY[y]];
            [tempYCoord addObject:tempNSNumber];
        }
    }
    
    tempWall.color = [UIColor colorWithRed:64.0/255.0 green:224.0/255.0 blue:208.0/255.0 alpha:1];
    tempWall.position = CGPointMake(tempGameObject.size.width*1.5  , tempWall.size.height/2);
    
    //loading stored cordinates into level3
    level.gameObjectsXCoord = tempXCoord;
    level.gameObjectsYCoord = tempYCoord;
    [level generateGameObjects];
    level.gameObjectsArray[8] = tempWall;
    return level;
}


@end

