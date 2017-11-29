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

@property (atomic) int numGameObjects;
@property (strong,nonatomic) NSMutableArray * gameObjectsArray;  // holds positions
@property (strong, nonatomic) UIColor * colour;

-(Level *)init;

@end
