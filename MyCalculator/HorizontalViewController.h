//
//  HorizontalViewController.h
//  MyCalculator
//
//  Created by Admin on 03.10.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizontalViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *mainScreenLable;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;


- (IBAction)actionPushNumber:(id)sender;
- (IBAction)actionPushSimpleOperation:(id)sender;
- (IBAction)actionPushEqual:(id)sender;
- (IBAction)actionPushPercentage:(id)sender;
- (IBAction)actionPushPlusMinus:(id)sender;
- (IBAction)actionPushPoint:(id)sender;
- (IBAction)actionPushAC:(id)sender;





@end
