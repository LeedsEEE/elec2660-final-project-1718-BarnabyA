//
//  GameViewController.m
//  Project3
//
//  Created by Barnaby Ayriss [el16ba] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Load the SKScene from 'GameScene.sks'
    NSLog(@"GameViewController - GameScene node beninging init");
    GameScene *scene = (GameScene *)[SKScene nodeWithFileNamed:@"GameScene"];
    //adds the parent view pointer to the scene
    scene._parentViewController = self;
    // Set the scale mode to scale to fit the window
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    SKView *skView = (SKView *)self.view;

    [skView presentScene:scene];
    
    //skView.showsFPS = YES;
    //skView.showsNodeCount = YES;
    NSLog(@"GameViewController - GameScene initialized");
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
}


@end
