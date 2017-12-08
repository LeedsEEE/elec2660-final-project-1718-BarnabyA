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
        
    }
    return self;
}

-(void)generateGameObjects{
    NSLog(@"Level/generateGameObjects- Running");
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
    }
    self.gameObjectsArray = gameObjects;
}
@end
