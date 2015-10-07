//
//  HorizontalViewController.m
//  MyCalculator
//
//  Created by Admin on 03.10.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import "HorizontalViewController.h"
#import "LogicCalculator.h"

@interface HorizontalViewController () <LogicCalculatorProtocol>

@property LogicCalculator* logicCalculator;

@end

@implementation HorizontalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.logicCalculator = [[LogicCalculator alloc] init];
    self.logicCalculator.logicDelegate = self;
    
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



#pragma mark - Action

- (IBAction)actionPushNumber:(id)sender {
    [self.logicCalculator inputDigit:[NSString stringWithFormat:@"%ld", (long)[sender tag]]];
}

- (IBAction)actionPushSimpleOperation:(id)sender {
    [self.logicCalculator simpleOperation:[sender tag]];
}

- (IBAction)actionPushEqual:(id)sender {
    [self.logicCalculator countTwoNumbers];
}

- (IBAction)actionPushPercentage:(id)sender {
    [self.logicCalculator percentageNumber];
}

- (IBAction)actionPushPlusMinus:(id)sender {
    [self.logicCalculator plusMinusNumber];
}

- (IBAction)actionPushPoint:(id)sender {
    [self.logicCalculator makePoint];
}

- (IBAction)actionPushAC:(id)sender {
    [self.logicCalculator clearAll];
}




#pragma mark - LogicCalculatorProtocol

- (void) calculatorLogicDidChangeValue:(NSString*) value {
    self.mainScreenLable.text = value;
}

- (void) clearButtonDidChange:(NSString*) value {
    [self.clearButton setTitle:value forState:UIControlStateNormal];
}

@end
