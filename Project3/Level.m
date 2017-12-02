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
        self.numGameObjects = 5;
        self.colour = [UIColor greenColor];
        
        for (int i = 0; i < self.numGameObjects; i++) {
            NSNumber *tempNum = @100;
            [self.gameObjectsXCoord addObject: tempNum];
            [self.gameObjectsYCoord addObject: tempNum];
            [self generateGameObjects];
        }
    }
    return self;
}

-(void)generateGameObjects{
    NSLog(@"Level/generateGameObjects- Running");
    
    GameObjects *tempPlatform = [GameObjects platform];
    NSMutableArray *gameObjects = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < self.numGameObjects ; i++) {
        tempPlatform.name = [NSString stringWithFormat:@"gameObjectPlatform%i",i];
        tempPlatform.color = self.colour;
        tempPlatform.position =
        CGPointMake([[self.gameObjectsXCoord objectAtIndex:i] floatValue],
                    [[self.gameObjectsYCoord objectAtIndex:i] floatValue]);
        [gameObjects addObject:tempPlatform];
    }
    self.gameObjectsArray = gameObjects;
}
@end
