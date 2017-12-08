//
//  TutorialViewController.h
//  Project3
//
//  Created by Barnaby Ayriss on 07/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lbOutTutorialTitle;
@property (weak, nonatomic) IBOutlet UIButton *btOutTutorialBack;
@property (weak, nonatomic) IBOutlet UIButton *btOutTutorialSlideBack;
@property (weak, nonatomic) IBOutlet UIButton *btOutTutorialSlideForward;
@property (weak, nonatomic) IBOutlet UIImageView *ivOutTutorialSlide;

- (IBAction)btACTutorialSlideBack:(UIButton *)sender;
- (IBAction)btACTutorialSlideForward:(UIButton *)sender;

@end
