//
//  GameScene.h
//  Project3
//
//  Created by Barnaby Ayriss [el16ba] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameObjects.h"
#import "player.h"
#import "DataModelLevels.h"
#import "GameScoreLabel.h"

@interface GameScene : SKScene <SKPhysicsContactDelegate>

@property (strong, nonatomic) DataModelLevels *levelData;
@property int currentLevel;
@property NSString *Gamefont;

@end

/*
To do 02:43 11/29
    -accout for variable size platfroms future implementation
    -add EndWin - framework implemented
    -add EndFail - framework implemented
 -add score - frame work implemented
 -add level transition - semi done
*/
