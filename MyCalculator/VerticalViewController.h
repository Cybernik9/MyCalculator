//
//  ViewController.h
//  MyCalculator
//
//  Created by Admin on 01.10.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VerticalViewController : UIViewController

@property (unsafe_unretained, nonatomic) IBOutlet UILabel *mainScreen;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *preScreen;



#pragma mark - Action

- (IBAction)actionPushNumberButton:(id)sender;
- (IBAction)actionPushOperationsButton:(id)sender;
- (IBAction)actionPushResultButton:(id)sender;
- (IBAction)actionACButton:(id)sender;
- (IBAction)actionPoint:(id)sender;
- (IBAction)actionPlusOrMinus:(id)sender;
- (IBAction)actionPercentage:(id)sender;

@end

