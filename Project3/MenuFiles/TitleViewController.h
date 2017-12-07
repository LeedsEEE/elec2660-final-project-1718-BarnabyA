//
//  TitleViewController.h
//  Project3
//
//  Created by Barnaby Ayriss [el16ba] on 05/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameViewController.h"
#import "UserDataModel.h"
#import "SettingsViewController.h"

@interface TitleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lbTitleTitle;
@property (weak, nonatomic) IBOutlet UIButton *btTitlePlay;
@property (weak, nonatomic) IBOutlet UIButton *btTitleSettings;
@property (weak, nonatomic) IBOutlet UIButton *btTitleTutorial;

- (IBAction)btTitlePlay:(UIButton *)sender;
- (IBAction)btTitleSettings:(UIButton *)sender;
- (IBAction)btTitleTutorial:(UIButton *)sender;







@end
