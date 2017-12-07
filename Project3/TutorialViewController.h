//
//  TutorialViewController.h
//  Project3
//
//  Created by Barnaby Ayriss on 07/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lbTutorialTitle;
@property (weak, nonatomic) IBOutlet UIButton *btTutorialBack;
@property (weak, nonatomic) IBOutlet UIButton *btTutorialSlideBack;
@property (weak, nonatomic) IBOutlet UIButton *btTutorialSlideForward;
@property (weak, nonatomic) IBOutlet UIImageView *ivTutorialSlide;

- (IBAction)btTutorialSlideBack:(UIButton *)sender;
- (IBAction)btTutorialSlideForward:(UIButton *)sender;




@end
