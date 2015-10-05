//
//  ViewController.m
//  MyCalculator
//
//  Created by Admin on 01.10.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import "VerticalViewController.h"
#import "Calculator.h"

typedef NS_ENUM(NSUInteger, OperationType) {
    OperationTypePlus = 11,
    OperationTypeMinus,
    OperationTypeMultiply,
    OperationTypeShare
};


@interface VerticalViewController ()

@end

@implementation VerticalViewController

static double numberOne;
static double numberTwo;
static CGFloat result;

static const NSInteger leftShiftToOneNumber = 10;
static NSInteger operations;
static char* operationsSymbol;

static bool isPoint;
static bool isPointNumberOne;
static NSInteger beforePointNumber;
static NSInteger afterPointNumber;


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
        case OperationTypePlus:
            operationsSymbol = "+";
            result = [Calculator plusTwoNumbers:numberOne numberTwo:numberTwo];
            break;
        case OperationTypeMinus:
            operationsSymbol = "-";
            result = [Calculator minusTwoNumbers:numberOne numberTwo:numberTwo];
            break;
        case OperationTypeMultiply:
            operationsSymbol = "x";
            result = [Calculator multiplyTwoNumbers:numberOne numberTwo:numberTwo];
            break;
        case OperationTypeShare:
            operationsSymbol = "/";
            result = [Calculator shareTwoNumbers:numberOne numberTwo:numberTwo];
            break;
    }
    //NSNumberFormatter
    //NSExpresion
    
    
    [self printNumberToMainScreen:result];
    
    if ([self.preScreen.text isEqualToString:@""]) {
        self.preScreen.text = [NSString stringWithFormat:@"%g %s %g",numberOne, operationsSymbol, numberTwo];
    } else {
        self.preScreen.text = [NSString stringWithFormat:@"%@ %s %g",self.preScreen.text, operationsSymbol, numberTwo];
    }
    
    numberOne = result;
    numberTwo = operations = 0;
    
}

- (void) printNumberToMainScreen:(CGFloat) number {
    self.mainScreen.text = [NSString stringWithFormat:@"%g",number];
}

#pragma mark - Action

- (IBAction)actionPushNumberButton:(id)sender {
    
    if (isPoint && operations) {
        beforePointNumber = numberTwo;
        afterPointNumber = afterPointNumber * leftShiftToOneNumber + [sender tag];
        self.mainScreen.text = [NSString stringWithFormat:@"%ld.%ld",(long)beforePointNumber,(long)afterPointNumber];
    } else if (isPoint) {
        beforePointNumber = numberOne;
        afterPointNumber = afterPointNumber * leftShiftToOneNumber + [sender tag];
        isPointNumberOne = true;
        self.mainScreen.text = [NSString stringWithFormat:@"%ld.%ld",(long)beforePointNumber,(long)afterPointNumber];
    } else if (operations) {
        numberTwo = numberTwo * leftShiftToOneNumber + [sender tag];
        [self printNumberToMainScreen:numberTwo];
    } else {
        numberOne = numberOne * leftShiftToOneNumber + [sender tag];
        [self printNumberToMainScreen:numberOne];
    }
    
}

- (IBAction)actionPushOperationsButton:(id)sender {
    //push + - X / % +/-
    
    if (isPoint) {
        NSString* strPointNumber;
        strPointNumber = self.mainScreen.text;
        isPointNumberOne ? (numberOne = strPointNumber.doubleValue) : (numberTwo = strPointNumber.doubleValue);
        isPoint = isPointNumberOne = false;
        afterPointNumber = beforePointNumber = 0;
    }
    
    if (numberOne && numberTwo && operations) {
        [self countTwoNumbers];
        operations = [sender tag];
    } else {
        operations = [sender tag];
    }
   
}

- (IBAction)actionPushResultButton:(id)sender {
    //push =
    
    if (isPoint) {
        NSString* strPointNumber;
        strPointNumber = [NSString stringWithFormat:@"%ld.%ld",(long)beforePointNumber,(long)afterPointNumber];
        isPointNumberOne ? (numberOne = strPointNumber.doubleValue) : (numberTwo = strPointNumber.doubleValue);
        isPoint = isPointNumberOne = false;
        afterPointNumber = beforePointNumber = 0;
    }
    
    [self countTwoNumbers];
}

- (IBAction)actionACButton:(id)sender {
    
    numberOne = numberTwo = result = operations = 0;
    afterPointNumber = beforePointNumber = 0;
    self.mainScreen.text = @"0";
    self.preScreen.text = @"";
}

- (IBAction)actionPoint:(id)sender {
    isPoint = YES;
}

- (IBAction)actionPlusOrMinus:(id)sender {
    
    if (numberTwo) {
        numberTwo *= -1;
        [self printNumberToMainScreen:numberTwo];
    } else {
        numberOne *= -1;
        [self printNumberToMainScreen:numberOne];
    }
}

- (IBAction)actionPercentage:(id)sender {
    
    if (numberTwo) {
        numberTwo /= 100;
        [self printNumberToMainScreen:numberTwo];
    } else {
        numberOne /= 100;
        [self printNumberToMainScreen:numberOne];
    }
}


@end
