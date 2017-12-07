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
#import "UserDataModel.h"

@interface GameScene : SKScene <SKPhysicsContactDelegate>

@property (strong, nonatomic) DataModelLevels *levelData;
//@property (strong, nonatomic) UserDataModel *userData;
@property int currentLevel;
@property NSString *Gamefont;
@property UIViewController *_parentViewController;

@end

/*
To do 02:43 11/29
    -accout for variable size platfroms future implementation
    -add EndWin - framework implemented
    -add EndFail - framework implemented
 -add score - frame work implemented
 -add level transition - semi done
*/
