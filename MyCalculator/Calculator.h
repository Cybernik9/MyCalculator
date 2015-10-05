//
//  Calculator.h
//  MyCalculator
//
//  Created by Admin on 03.10.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

+ (double) plusTwoNumbers:(double)numberOne numberTwo:(double)numberTwo;
+ (double) minusTwoNumbers:(double)numberOne numberTwo:(double)numberTwo;
+ (double) multiplyTwoNumbers:(double)numberOne numberTwo:(double)numberTwo;
+ (double) shareTwoNumbers:(double)numberOne numberTwo:(double)numberTwo;

@end
