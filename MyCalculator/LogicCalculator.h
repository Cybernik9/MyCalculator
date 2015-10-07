//
//  LogicCalculator.h
//  MyCalculator
//
//  Created by Admin on 07.10.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogicCalculator : NSObject

- (NSString*) inputDigit:(NSString*) number;


@property (nonatomic, weak) NSObject <LogicCalculator> *logicDelegate;

@end
