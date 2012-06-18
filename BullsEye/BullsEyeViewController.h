//
//  BullsEyeViewController.h
//  BullsEye
//
//  Created by Raj Kandati on 3/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BullsEyeViewController : UIViewController <UIAlertViewDelegate>

@property (nonatomic, strong) IBOutlet UISlider *slider;
@property (nonatomic, strong) IBOutlet UILabel *targetValueLabel;
@property (nonatomic, strong) IBOutlet UILabel *scoreLabel;
@property (nonatomic, strong) IBOutlet UILabel *roundLabel;

- (IBAction)hitMeButtonTapped:(UIButton *)button;
- (IBAction)sliderMoved:(UISlider *)sender;
- (IBAction)startOverButtonPressed:(id)sender;
- (IBAction)showInfo:(UIButton *)sender;

@end
