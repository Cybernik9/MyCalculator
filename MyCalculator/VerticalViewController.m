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

static bool isMinus;
static bool isPushResultButton;
static bool isPushOperation;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - My heper methods

- (void) countTwoNumbers {
    
    switch (operations) {
        case OperationTypePlus:
            result = [Calculator plusTwoNumbers:numberOne numberTwo:numberTwo];
            break;
        case OperationTypeMinus:
            result = [Calculator minusTwoNumbers:numberOne numberTwo:numberTwo];
            break;
        case OperationTypeMultiply:
            result = [Calculator multiplyTwoNumbers:numberOne numberTwo:numberTwo];
            break;
        case OperationTypeShare:
            result = [Calculator shareTwoNumbers:numberOne numberTwo:numberTwo];
            break;
    }
    //NSNumberFormatter
    //NSExpresion
    
    
    [self printNumberToMainScreen:result];
    
    if (isPushResultButton) {
        self.preScreen.text = [NSString stringWithFormat:@"",self.preScreen.text, numberTwo];
    }
    
    numberOne = result;
    numberTwo = operations = 0;
    operationsSymbol = "";
}

- (void) printNumberToMainScreen:(CGFloat) number {
    self.mainScreen.text = [NSString stringWithFormat:@"%g",number];
}

- (void) printNumberToPreScreen {
    //self.preScreen.text = [NSString stringWithFormat:@"%g",number];
}

- (void) twoIntegerNumberToOneFloat {
    NSString* strPointNumber;
    strPointNumber = self.mainScreen.text;
    isPointNumberOne ? (numberOne = strPointNumber.doubleValue) : (numberTwo = strPointNumber.doubleValue);
    isPoint = isPointNumberOne = NO;
    afterPointNumber = beforePointNumber = 0;
}

#pragma mark - Action

- (IBAction)actionPushNumberButton:(id)sender {
    
    if (isMinus && operations) {
        numberTwo = numberTwo * leftShiftToOneNumber - [sender tag];
        [self printNumberToMainScreen:numberTwo];
    } else if (isMinus) {
        numberOne = numberOne * leftShiftToOneNumber - [sender tag];
        [self printNumberToMainScreen:numberOne];
    }else if (isPoint && operations) {
        beforePointNumber = numberTwo;
        afterPointNumber = afterPointNumber * leftShiftToOneNumber + [sender tag];
        //[self twoIntegerNumberToOneFloat];
        self.mainScreen.text = [NSString stringWithFormat:@"%ld.%ld",(long)beforePointNumber,(long)afterPointNumber];
    } else if (isPoint) {
        beforePointNumber = numberOne;
        afterPointNumber = afterPointNumber * leftShiftToOneNumber + [sender tag];
        isPointNumberOne = YES;
        //[self twoIntegerNumberToOneFloat];
        self.mainScreen.text = [NSString stringWithFormat:@"%ld.%ld",(long)beforePointNumber,(long)afterPointNumber];
    } else if (operations) {
        numberTwo = numberTwo * leftShiftToOneNumber + [sender tag];
        [self printNumberToMainScreen:numberTwo];
    } else {
        numberOne = numberOne * leftShiftToOneNumber + [sender tag];
        [self printNumberToMainScreen:numberOne];
    }
    
    isPushOperation = NO;
}

- (IBAction)actionPushOperationsButton:(id)sender {
    //push + - X / % +/-
    
    switch ([sender tag]) {
        case OperationTypePlus:
            operationsSymbol = "+";
            break;
        case OperationTypeMinus:
            operationsSymbol = "-";
            break;
        case OperationTypeMultiply:
            operationsSymbol = "x";
            break;
        case OperationTypeShare:
            operationsSymbol = "/";
            break;
    }
    
    if ([self.preScreen.text isEqualToString:@""]) {
        self.preScreen.text = [NSString stringWithFormat:@"%g %s ",numberTwo?numberTwo:numberOne, operationsSymbol];
    } else {
        if (isPushOperation) {
            self.preScreen.text = [self.preScreen.text substringToIndex:self.preScreen.text.length-3];
            self.preScreen.text = [NSString stringWithFormat:@"%@ %s ",self.preScreen.text, operationsSymbol];
        } else {
            self.preScreen.text = [NSString stringWithFormat:@"%@ %g %s ",self.preScreen.text ,numberTwo?numberTwo:numberOne, operationsSymbol];
        }
    }
    
    if (isPoint) {
        [self twoIntegerNumberToOneFloat];
    }
    
    if (numberOne && numberTwo && operations) {
        [self countTwoNumbers];
        operations = [sender tag];
    } else {
        operations = [sender tag];
    }
    
    isMinus = NO;
    isPushOperation = YES;
}

- (IBAction)actionPushResultButton:(id)sender {
    //push =
    
    isPushResultButton = YES;
    
    if (numberOne && numberTwo && operations) {
        if (isPoint) {
            [self twoIntegerNumberToOneFloat];
        }
        [self countTwoNumbers];
    }
    
    isPushResultButton = NO;
}

- (IBAction)actionACButton:(id)sender {
    //push AC
    
    numberOne = numberTwo = result = operations = 0;
    afterPointNumber = beforePointNumber = 0;
    
    self.mainScreen.text = @"0";
    self.preScreen.text = @"";
    
    isPoint = isPointNumberOne = isMinus = NO;
}

- (IBAction)actionPoint:(id)sender {
    isPoint = YES;
}

- (IBAction)actionPlusOrMinus:(id)sender {
    //push +/-

    if (isPushOperation) {
        [self printNumberToMainScreen:-0];
    }else if (numberTwo) {
        numberTwo *= -1;
        [self printNumberToMainScreen:numberTwo];
        //self.preScreen.text = [NSString stringWithFormat:@"%@ %g",self.preScreen.text, numberTwo];
    } else {
        numberOne *= -1;
        [self printNumberToMainScreen:numberOne];
        //if ([self.preScreen.text isEqualToString:@""]) {
        //    self.preScreen.text = [NSString stringWithFormat:@"%g",numberOne];
       // } else {
        //    self.preScreen.text = [NSString stringWithFormat:@"%@ %g",self.preScreen.text, numberOne];
       // }
    }
    
    isMinus? (isMinus = NO) : (isMinus = YES);
    
}

- (IBAction)actionPercentage:(id)sender {
    //push %
    
    if (numberTwo) {
        numberTwo /= 100;
        [self printNumberToMainScreen:numberTwo];
    } else {
        numberOne /= 100;
        [self printNumberToMainScreen:numberOne];
    }
}


@end
