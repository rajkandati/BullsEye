//
//  AboutViewController.h
//  BullsEye
//
//  Created by Raj Kandati on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController
@property(nonatomic, strong) IBOutlet UIWebView *webView;

- (IBAction)closeInfo;

@end
