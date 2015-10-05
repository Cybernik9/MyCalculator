//
//  ViewController.m
//  MyCalculator
//
//  Created by Admin on 01.10.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import "VerticalViewController.h"
#import "Calculator.h"
@interface VerticalViewController ()

@end

@implementation VerticalViewController

static double numberOne;
static double numberTwo;
static double result;

static NSInteger operations;
static char* operationsSymbol;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) countTwoNumbers {
    
    switch (operations) {
        case 11:
            operationsSymbol = "+";
            result = [Calculator plusTwoNumbers:numberOne numberTwo:numberTwo];
            break;
        case 12:
            operationsSymbol = "-";
            result = [Calculator minusTwoNumbers:numberOne numberTwo:numberTwo];
            break;
        case 13:
            operationsSymbol = "x";
            result = [Calculator multiplyTwoNumbers:numberOne numberTwo:numberTwo];
            break;
        case 14:
            operationsSymbol = "/";
            result = [Calculator shareTwoNumbers:numberOne numberTwo:numberTwo];
            break;
    }
    
    self.mainScreen.text = [NSString stringWithFormat:@"%2.f",result];
    
    if ([self.preScreen.text isEqualToString:@""]) {
        self.preScreen.text = [NSString stringWithFormat:@"%2.f %s %2.f",numberOne, operationsSymbol, numberTwo];
    } else {
        self.preScreen.text = [NSString stringWithFormat:@"%@ %s %2.f",self.preScreen.text, operationsSymbol, numberTwo];
    }
    
    numberOne = result;
    numberTwo = operations = 0;

    //operationsSymbol = @"";
}

#pragma mark - Action

- (IBAction)actionPushNumberButton:(id)sender {
    
    if (operations) {
        numberTwo = numberTwo * 10 + [sender tag];
        self.mainScreen.text = [NSString stringWithFormat:@"%2.f",numberTwo];
    } else {
        numberOne = numberOne * 10 + [sender tag];
        self.mainScreen.text = [NSString stringWithFormat:@"%2.f",numberOne];
    }
    
}

- (IBAction)actionPushOperationsButton:(id)sender {
    //push + - X / % +/-
    
    if (numberOne && numberTwo && operations) {
        [self countTwoNumbers];
        operations = [sender tag];
    } else {
        operations = [sender tag];
    }
    
    
    
    
    
    
}

- (IBAction)actionPushResultButton:(id)sender {
    //push =
    [self countTwoNumbers];
}
@end
