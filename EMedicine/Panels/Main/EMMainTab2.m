//
//  EMMainTab2.m
//  EMedicine
//
//  Created by lyxia on 15/6/11.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import "EMMainTab2.h"
#import "EMViewControllerManager.h"
#import "EMAppContext.h"

@interface EMMainTab2 ()

@end

@implementation EMMainTab2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)intoNewfearture:(UIButton *)sender {
}

- (IBAction)intoLogin:(id)sender {
    [EMAppContext shareInstance].userState = UserStateOffLine;
    [[EMViewControllerManager shareInstance] presentViewControllerByName:[EMLoginVC className] data:nil];
}

@end
