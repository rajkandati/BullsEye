//
//  BullsEyeViewController.m
//  BullsEye
//
//  Created by Raj Kandati on 3/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BullsEyeViewController.h"
#import "AboutViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface BullsEyeViewController ()

@end

@implementation BullsEyeViewController {
    int currentValue;
    int targetValue;
    int score;
    int round;
}

@synthesize slider = _slider;
@synthesize targetValueLabel;
@synthesize scoreLabel;
@synthesize roundLabel;


- (void)updateLabels
{
    self.targetValueLabel.text = [NSString stringWithFormat:@"%d", targetValue];
    self.scoreLabel.text       = [NSString stringWithFormat:@"%d", score];
    self.roundLabel.text       = [NSString stringWithFormat:@"%d", round];
}

- (void)startNewRound
{
    round += 1;
    targetValue = 1 + (arc4random() % 100);
    
    currentValue = 0;
    self.slider.value = currentValue;
}

- (void)startNewGame
{
    score = 0;
    round = 0;
    [self startNewRound];
    [self updateLabels];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self startNewRound];
    [self updateLabels];
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    
    UIImage *trackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
    [self.slider setMinimumTrackImage:trackLeftImage forState:UIControlStateNormal];
    
    UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    _slider = nil;
    self.targetValueLabel = nil;
    self.scoreLabel = nil;
    self.roundLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (IBAction)hitMeButtonTapped:(UIButton *)button
{
    int difference = abs(currentValue - targetValue);
    int points     = 100 - difference;
    
    NSString *title;
    if (difference == 0) {
        title = @"Perfect!";
        points += 100;
    } else if (difference < 5) {
        title = @"You almost had it!";
        points += 50;
    } else if (difference < 10) {
        title = @"Pretty good!";
    } else {
        title = @"Not even close...";
    }
    
    
    score += points;
    NSString *message = [NSString stringWithFormat:@"You scored %d points", points];
    
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:title 
                                                 message:message 
                                                delegate:self 
                                       cancelButtonTitle:@"OK" 
                                       otherButtonTitles:nil];
    [av show];

}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self startNewRound];
    [self updateLabels];
}

- (IBAction)sliderMoved:(UISlider *)sender
{
    currentValue = lroundf(sender.value);
}


- (IBAction)startOverButtonPressed:(id)sender
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [self startNewGame];
    [self updateLabels];
    
    [self.view.layer addAnimation:transition forKey:nil];
}


- (IBAction)showInfo:(UIButton *)sender
{
    AboutViewController *avc = [[AboutViewController alloc] init];
    avc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:avc animated:YES completion:nil];
}

@end
