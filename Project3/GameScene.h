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

@interface GameScene : SKScene

@end

/*
To do 02:43 11/29
 -finish implementing level generation
    -attach to frame
    -chain child attach so that their positions are reletive to the last platform
    -accout for variable size platfroms future implementation
 -fix infinate jump
 -add end state
    -add EndWin
    -add EndFail
        -collision
 -add score
 -add level transition
*/
