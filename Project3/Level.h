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
@property (strong,nonatomic) NSMutableArray * gameObjectsArray;  // holds positions
@property (strong, nonatomic) UIColor * colour; // colds the colour the platforms will be in the level

-(Level *)init;
-(NSMutableArray *)generateGameObjects;
@end
