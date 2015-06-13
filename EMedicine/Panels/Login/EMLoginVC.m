//
//  EMLoginVC.m
//  EMedicine
//
//  Created by lyxia on 15/6/10.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import "EMLoginVC.h"
#import "EMViewControllerManager.h"
#import "EMAppContext.h"

@interface EMLoginVC ()
@property (nonatomic, assign) VCTransitionAnimationType animationType;
@end

@implementation EMLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setData:(id)data
{
    if ([data isKindOfClass:[NSNumber class]]) {
        self.animationType = ((NSNumber *)data).integerValue;
    }
}

- (IBAction)intoMainVC:(UIButton *)sender {
    [EMAppContext shareInstance].userState = UserStateOnLine;
    [[EMViewControllerManager shareInstance] presentViewControllerByName:[EMMainTabVC className] animationType:VCTransitionAnimationTypeAllLeft data:nil];
}

- (IBAction)intoPasswordVC:(UIButton *)sender {
    [[EMViewControllerManager shareInstance] presentViewControllerByName:[EMForgetPasswordVC className] data:nil];
}

- (IBAction)intoRegister:(UIButton *)sender {
    [[EMViewControllerManager shareInstance] presentViewControllerByName:[EMRegisterVC className] data:nil];
}

@end
