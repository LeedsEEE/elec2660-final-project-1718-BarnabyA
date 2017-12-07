//
//  SettingsViewController.m
//  Project3
//
//  Created by Barnaby Ayriss [el16ba] on 05/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "SettingsViewController.h"
#import "TitleViewController.h"


@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Settings %0.f",self.userData.settings.difficulty);
    NSLog(@"stop test");
    
    self.lbSettingsDiffuculty.text = [NSString stringWithFormat:@"Difficulty: %0.f", self.slSettingsDifficulty.value];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)slSettingsDifficulty:(UISlider *)sender {
    self.lbSettingsDiffuculty.text = [NSString stringWithFormat:@"Difficulty: %0.f", self.slSettingsDifficulty.value];
    self.userData.settings.difficulty = self.slSettingsDifficulty.value;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqual: @"SettingsTitle"]){
        TitleViewController *_titleViewController = [segue destinationViewController];
        _titleViewController.userData = self.userData;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
