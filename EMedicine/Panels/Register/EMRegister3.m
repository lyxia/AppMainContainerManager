//
//  EMForgetPassword3.m
//  EMedicine
//
//  Created by lyxia on 15/6/11.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import "EMRegister3.h"
#import "EMViewControllerManager.h"
#import "EMAppContext.h"

@interface EMRegister3 ()

@end

@implementation EMRegister3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)Complete:(UIBarButtonItem *)sender {
    [EMAppContext shareInstance].userState = UserStateOnLine;
    [[EMViewControllerManager shareInstance] presentViewControllerByName:[EMMainTabVC className] animationType:VCTransitionAnimationTypeAllLeft data:nil];
}

- (IBAction)back:(UIBarButtonItem *)sender {
    [[EMViewControllerManager shareInstance] dismissViewController];
}
@end
