//
//  Level.m
//  Project3
//
//  Created by Barnaby Ayriss on 29/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Level.h"

@implementation Level

-(Level *)init{
    Level *level;
    level.numGameObjects = 0;
    level.colour = [UIColor greenColor];
    level.gameObjectsArray = [self generateGameObjects];
    return level;
}

-(NSMutableArray *)generateGameObjects{
    NSLog(@"Level/generateGameObjects- Running");
    GameObjects *tempPlatform = [GameObjects platform];
    NSMutableArray *gameObjects = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < self.numGameObjects ; i++) {
        tempPlatform.name = [NSString stringWithFormat:@"gameObjectPlatform%i",i];
        tempPlatform.color = self.colour;
        tempPlatform.position = CGPointMake(tempPlatform.size.width,0);
    }
    
    return gameObjects;
}

@end
