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
    level.gameObjectsArray = [[NSMutableArray alloc] init];
    
    return level;
}

@end
