//
//  EMMainTab1.m
//  EMedicine
//
//  Created by lyxia on 15/6/11.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import "EMMainTab1.h"
#import "EMViewControllerManager.h"
#import "EMAppContext.h"

@interface EMMainTab1 ()

@end

@implementation EMMainTab1

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
