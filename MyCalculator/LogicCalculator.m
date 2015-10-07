//
//  LogicCalculator.m
//  MyCalculator
//
//  Created by Admin on 07.10.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import "LogicCalculator.h"

@implementation LogicCalculator

typedef NS_ENUM(NSUInteger, OperationType) {
    OperationTypePlus = 11,
    OperationTypeMinus,
    OperationTypeMultiply,
    OperationTypeShare
};

static NSString* firstNumber  = @"";
static NSString* secondNumber = @"";

static NSInteger operations;
static NSString* operationsSymbol;

static bool isClearAll = YES;
static bool isPoint;

- (void) inputDigit:(NSString*) number {
    
    if ([firstNumber isEqualToString:@"-0"]) {
        firstNumber = [firstNumber substringToIndex:firstNumber.length-1];
    } else if ([secondNumber isEqualToString:@"-0"]) {
        secondNumber = [secondNumber substringToIndex:secondNumber.length-1];
    }
    
    if (!operations) {
        firstNumber = [NSString stringWithFormat:@"%@%@",firstNumber,number];
        [self.logicDelegate calculatorLogicDidChangeValue:firstNumber];
    } else {
        secondNumber = [NSString stringWithFormat:@"%@%@",secondNumber,number];
        [self.logicDelegate calculatorLogicDidChangeValue:secondNumber];
    }
    
    isClearAll = NO;
    [self.logicDelegate clearButtonDidChange:@"C"];
}

- (void) simpleOperation:(NSInteger) operation {
    
    if (operations) {
        [self countTwoNumbers];
    }
    
    operations = operation;
    
    switch (operation) {
        case OperationTypePlus:
            operationsSymbol = @"+";
            break;
        case OperationTypeMinus:
            operationsSymbol = @"-";
            break;
        case OperationTypeMultiply:
            operationsSymbol = @"x";
            break;
        case OperationTypeShare:
            operationsSymbol = @"/";
            break;
    }
    
    isPoint = NO;
}

- (void) countTwoNumbers {
    
    switch (operations) {
        case OperationTypePlus:
            firstNumber = [NSString stringWithFormat:@"%g", firstNumber.doubleValue + secondNumber.doubleValue];
            [self.logicDelegate calculatorLogicDidChangeValue:firstNumber];
            break;
        case OperationTypeMinus:
            firstNumber = [NSString stringWithFormat:@"%g", firstNumber.doubleValue - secondNumber.doubleValue];
            [self.logicDelegate calculatorLogicDidChangeValue:firstNumber];
            break;
        case OperationTypeMultiply:
            firstNumber = [NSString stringWithFormat:@"%g", firstNumber.doubleValue * secondNumber.doubleValue];
            [self.logicDelegate calculatorLogicDidChangeValue:firstNumber];
            break;
        case OperationTypeShare:
            firstNumber = [NSString stringWithFormat:@"%g", firstNumber.doubleValue / secondNumber.doubleValue];
            [self.logicDelegate calculatorLogicDidChangeValue:firstNumber];
            break;
    }
    
    secondNumber = @"";
    [self.logicDelegate calculatorLogicDidChangeValue:firstNumber];
}

- (void) plusMinusNumber {
    
    if (operations) {
        secondNumber = [NSString stringWithFormat:@"%g",secondNumber.doubleValue * (-1)];
        [self.logicDelegate calculatorLogicDidChangeValue:secondNumber];
    } else {
        firstNumber = [NSString stringWithFormat:@"%g",firstNumber.doubleValue * (-1)];
        [self.logicDelegate calculatorLogicDidChangeValue:firstNumber];
    }
}

- (void) makePoint {
    
    if (isPoint) {
        return;
    }
    
    if (operations) {
        if ([secondNumber isEqualToString:@""]) {
            secondNumber = @"0.";
        } else {
            secondNumber = [NSString stringWithFormat:@"%@.",secondNumber];
        }
        [self.logicDelegate calculatorLogicDidChangeValue:secondNumber];
    } else {
        if ([firstNumber isEqualToString:@""]) {
            firstNumber = @"0.";
        } else {
            firstNumber = [NSString stringWithFormat:@"%@.",firstNumber];
        }
        [self.logicDelegate calculatorLogicDidChangeValue:firstNumber];
    }
    
    isPoint = YES;
}

- (void) percentageNumber {
    
    if (operations) {
        secondNumber = [NSString stringWithFormat:@"%g",secondNumber.doubleValue / 100];
        [self.logicDelegate calculatorLogicDidChangeValue:secondNumber];
    } else {
        firstNumber = [NSString stringWithFormat:@"%g",firstNumber.doubleValue / 100];
        [self.logicDelegate calculatorLogicDidChangeValue:firstNumber];
    }
}

- (void) clearAll {
    
    if ([secondNumber isEqualToString:@""]) {
        firstNumber = @"";
        operations = 0;
        [self.logicDelegate calculatorLogicDidChangeValue:@"0"];
    } else {
        secondNumber = @"";
        [self.logicDelegate calculatorLogicDidChangeValue:secondNumber];
    }
    
    [self.logicDelegate clearButtonDidChange:@"AC"];
}

@end
