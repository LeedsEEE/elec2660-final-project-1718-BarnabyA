//
//  Level.h
//  Project3
//
//  Created by Barnaby Ayriss on 29/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameObjects.h"
@interface Level : NSObject

@property (atomic) int numGameObjects; // holds the number of platforms that will be in the level
@property (strong,nonatomic) NSMutableArray * gameObjectsArray;  // holds nodes
@property (strong, nonatomic) UIColor * colour; // colds the colour the platforms will be in the level
@property (strong,nonatomic) NSMutableArray * gameObjectsXCoord; //holds X coordinate of gameObjects before they are written added to their gameObjects
@property (strong,nonatomic) NSMutableArray * gameObjectsYCoord; //holds Y coordinate of gameObjects before they are written added to their gameObjects

-(void)generateGameObjects;

@end
