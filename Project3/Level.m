//
//  Level.m
//  Project3
//
//  Created by Barnaby Ayriss on 29/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Level.h"
@implementation Level

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Level/init- Running");
        self.numGameObjects = 5;
        self.colour = [UIColor greenColor];
        /*
        for (int i = 0; i < self.numGameObjects; i++) {
            NSNumber *tempNum = @100;
            [self.gameObjectsXCoord addObject: tempNum];
            [self.gameObjectsYCoord addObject: tempNum];
            NSLog(@"Level/init- X coordinates: %lu", self.gameObjectsXCoord.count);
            NSLog(@"Level/init- Y coordinates: %lu", self.gameObjectsXCoord.count);
            NSLog(@"Level/init- gameObjects: %lu", self.gameObjectsArray.count);
        }
         */
        //[self generateGameObjects];
    }
    return self;
}

-(void)generateGameObjects{
    NSLog(@"Level/generateGameObjects- Running");
   GameObjects *tempPlatformTest = [GameObjects platform];
    NSMutableArray *gameObjects = [[NSMutableArray alloc] init];
    [self.gameObjectsArray removeAllObjects];
    
    for (int i = 0; i < self.numGameObjects ; i++) {
        GameObjects *tempPlatform = [GameObjects platform];
        tempPlatform.name = [NSString stringWithFormat:@"gameObjectPlatform%i",i];
        tempPlatform.color = self.colour;
        tempPlatform.position =
        CGPointMake([[self.gameObjectsXCoord objectAtIndex:i] floatValue],
                    [[self.gameObjectsYCoord objectAtIndex:i] floatValue]);
        
        NSLog(@"Level/generateGameObjects- Loaded Position ( %0.f, %0.f )",[[self.gameObjectsXCoord objectAtIndex:i] floatValue], [[self.gameObjectsYCoord objectAtIndex:i] floatValue]);
        NSLog(@"Level/generateGameObjects- adding %@",tempPlatform.name);
        NSLog(@"Level/generateGameObjects- set ( %0.f , %0.f )",tempPlatform.position.x, tempPlatform.position.y);
        NSLog(@"Level/generateGameObjects- gameobjects added: %lu ",gameObjects.count);
        
        [gameObjects addObject:tempPlatform];
        
        
        NSLog(@"--------------------------------------------------------------------------------------------");
        tempPlatform = [gameObjects objectAtIndex:0];
        NSLog(@"[0] name: %@",tempPlatform.name);
        NSLog(@"--------------------------------------------------------------------------------------------");
    }
    self.gameObjectsArray = gameObjects;
    
    NSLog(@"Level/generateGameObjects- %lu game objects created",self.gameObjectsArray.count);
    tempPlatformTest = [self.gameObjectsArray objectAtIndex:0];
    NSLog(@"gameObjectsArray[0] name: %@",tempPlatformTest.name);
    tempPlatformTest = [gameObjects objectAtIndex:0];
    NSLog(@"gameObjects[0] name: %@",tempPlatformTest.name);
    tempPlatformTest = [gameObjects objectAtIndex:3];
    NSLog(@"gameObjects[3] name: %@",tempPlatformTest.name);
    tempPlatformTest = [gameObjects objectAtIndex:4];
    NSLog(@"gameObjects[4] name: %@",tempPlatformTest.name);
    NSLog(@"test");
}
@end
