//
//  ViewController.m
//  MyCalculator
//
//  Created by Admin on 01.10.15.
//  Copyright (c) 2015 HY. All rights reserved.
//

#import "VerticalViewController.h"

@interface VerticalViewController ()

@end

@implementation VerticalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionPushButton:(id)sender {
    
    if ([sender tag] >= 0 && [sender tag] <= 9) {
        //number push
    } else if ([sender tag] >= 11 && [sender tag] <= 16) {
        //push + - X / % +/-
    } else if ([sender tag] == 10) {
        //push =
    } else if ([sender tag] == 17) {
        //push AC
    } else if ([sender tag] == 18) {
        //push .
    }
    
}
@end
