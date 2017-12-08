//
//  TutorialViewController.m
//  Project3
//
//  Created by Barnaby Ayriss on 07/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "TutorialViewController.h"

@interface TutorialViewController ()

@property int currentSlide;
@property NSMutableArray *tutorialImagesArray;

@end

@implementation TutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Loades the slide show image names into an array
    self.tutorialImagesArray = [[NSMutableArray alloc] init];
    [self.tutorialImagesArray addObject:@"Slide0.png"];
    [self.tutorialImagesArray addObject:@"Slide1.png"];
    [self.tutorialImagesArray addObject:@"Slide2.png"];
    [self.tutorialImagesArray addObject:@"Slide3.png"];
    [self.tutorialImagesArray addObject:@"Slide4.png"];
    [self updateSlideShow];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)btACTutorialSlideForward:(UIButton *)sender {
    //Moves the slideshow forward one image
    self.currentSlide++;
    [self updateSlideShow];
}

- (IBAction)btACTutorialSlideBack:(UIButton *)sender {
    //Moves the slideshow back one image
    self.currentSlide--;
    [self updateSlideShow];
}

-(void)updateSlideShow{
    //updates the slide show image and prevents the user from calling an image not in the image array
    if(self.currentSlide <= 0){
        self.btOutTutorialSlideBack.enabled = false;
        self.btOutTutorialSlideBack.alpha = 0.25;
        
    }else if(self.currentSlide >= self.tutorialImagesArray.count - 1){
        self.btOutTutorialSlideForward.enabled = false;
        self.btOutTutorialSlideForward.alpha = 0.25;
        
    }else{
        self.btOutTutorialSlideForward.enabled = true;
        self.btOutTutorialSlideBack.enabled = true;
        self.btOutTutorialSlideForward.alpha = 1;
        self.btOutTutorialSlideBack.alpha = 1;
    }
    
    UIImage *currentImage = [UIImage imageNamed:self.tutorialImagesArray[self.currentSlide]];
    [self.ivOutTutorialSlide setImage:currentImage];
    self.lbOutTutorialTitle.text = [NSString  stringWithFormat:@"Tutorial: Image %i/%lu",self.currentSlide + 1, self.tutorialImagesArray.count];
    
}

@end
