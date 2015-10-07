//
//  LogicCalculator.m
//  MyCalculator
//
//  Created by Admin on 07.10.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import "LogicCalculator.h"

@implementation LogicCalculator



static NSString* firstNumber;
static NSString* secondNumber;

- (NSString*) inputDigit:(NSString*) number {
    if ([secondNumber isEqualToString:@""]) {
        firstNumber = [NSString stringWithFormat:@"%@%@",firstNumber,number];
        return firstNumber;
    } else {
        secondNumber = [NSString stringWithFormat:@"%@%@",secondNumber,number];
        return secondNumber;
    }
}

@end
