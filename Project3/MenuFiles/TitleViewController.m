//
//  TitleViewController.m
//  Project3
//
//  Created by Barnaby Ayriss [el16ba] on 05/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "TitleViewController.h"

@interface TitleViewController ()

@end

@implementation TitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //NSLog(@"Title difficulty %0.f",self.userData.settings.difficulty);
    //NSLog(@"stop test");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)btTitlePlay:(UIButton *)sender {
}

- (IBAction)btTitleSettings:(UIButton *)sender {
}

- (IBAction)btTitleTutorial:(UIButton *)sender {
}
@end
