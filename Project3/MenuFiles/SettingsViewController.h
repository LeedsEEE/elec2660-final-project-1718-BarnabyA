//
//  SettingsViewController.h
//  Project3
//
//  Created by Barnaby Ayriss [el16ba] on 05/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserDataModel.h"

@interface SettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btSettingsBack;
@property (weak, nonatomic) IBOutlet UILabel *lbSettingsTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbSettingsEasy;
@property (weak, nonatomic) IBOutlet UILabel *lbSettingsHard;
@property (weak, nonatomic) IBOutlet UILabel *lbSettingsDiffuculty;
@property (weak, nonatomic) IBOutlet UISlider *slSettingsDifficulty;

- (IBAction)slSettingsDifficulty:(UISlider *)sender;


@end
