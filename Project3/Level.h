//
//  Level.h
//  Project3
//
//  Created by Barnaby Ayriss on 29/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameObjects.h"
@interface Level : NSObject{
    int maxGameObjects;
    float coordX[100];
    float coordY[100];
}

@property (atomic) int numGameObjects; // holds the number of platforms that will be in the level
@property (strong,nonatomic) NSMutableArray * gameObjectsArray;  // holds nodes
@property (strong, nonatomic) UIColor * colour; // colds the colour the platforms will be in the level
@property (strong,nonatomic) NSMutableArray * gameObjectsXCoord;
@property (strong,nonatomic) NSMutableArray * gameObjectsYCoord;

-(NSMutableArray *)generateGameObjects: (int)NOObject LevelColour:(UIColor *)colour positionX:(float *)coordX positionY:(float *)coordY;

@end
