//
//  GameScene.h
//  Project3
//
//  Created by Barnaby Ayriss [el16ba] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameViewController.h"
#import "GameObjects.h"
#import "player.h"
#import "DataModelLevels.h"
#import "GameLabel.h"


@interface GameScene : SKScene <SKPhysicsContactDelegate>

@property (strong, nonatomic) DataModelLevels *levelData;   //Stores the level Data to be loaded
@property int currentLevel;                                 //Stores the current level
@property NSString *gameFont;                               //Stores the game's font
@property UIViewController *_parentViewController;          //stores a pointer to the sceanes parent view controller

@end
