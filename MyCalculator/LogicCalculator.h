//
//  LogicCalculator.h
//  MyCalculator
//
//  Created by Admin on 07.10.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LogicCalculatorProtocol <NSObject>

- (void)calculatorLogicDidChangeValue:(NSString *)value;
- (void) clearButtonDidChange:(NSString*) value;

@end

@interface LogicCalculator : NSObject

- (void) inputDigit:(NSString*) number;
- (void) simpleOperation:(NSInteger) operation;
- (void) countTwoNumbers;
- (void) plusMinusNumber;
- (void) makePoint;
- (void) percentageNumber;
- (void) clearAll;

@property (nonatomic, weak) NSObject <LogicCalculatorProtocol> *logicDelegate;

@end
