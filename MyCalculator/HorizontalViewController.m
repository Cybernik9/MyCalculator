//
//  HorizontalViewController.m
//  MyCalculator
//
//  Created by Admin on 03.10.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import "HorizontalViewController.h"
#import "LogicCalculator.h"

@interface HorizontalViewController ()

@property LogicCalculator* calc;

@end

@implementation HorizontalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.calc = [[LogicCalculator alloc] init];
    self.calc.logicDelegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/





- (IBAction)actionPushNumber:(id)sender {
    
}

- (IBAction)actionPushSimpleOperation:(id)sender {
}

- (IBAction)actionPushEqual:(id)sender {
}

- (IBAction)actionPushPercentage:(id)sender {
}

- (IBAction)actionPushPlusMinus:(id)sender {
}

- (IBAction)actionPushPoint:(id)sender {
}

- (IBAction)actionPushAC:(id)sender {
}
@end
