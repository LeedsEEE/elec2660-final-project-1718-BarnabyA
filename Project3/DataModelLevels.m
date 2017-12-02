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
        
        self.levelsArray = [NSMutableArray array];
        self.level1.colour = [UIColor blueColor];
        
        
        
        [self.levelsArray addObject:leve1];
    }
    return self;
}

-(Level *) loadLevel1{
    
    
    
    
    float
    GameObjects *tempObject = [GameObjects platform];
    Level *level1 = [[Level alloc]init];
    level1.colour = [UIColor blueColor];
    level1.gameObjectsArray = [Level generateGameObjects:10 LevelColour:level1.colour];
    for (int i; i < 10; i++) {
        tempObject = [level1.gameObjectsArray objectAtIndex:i];
        tempObject.position = CGPointMake(<#CGFloat x#>, <#CGFloat y#>)
    }
    return level1;
}
@end
