//
//  EMStartVC.m
//  EMedicine
//
//  Created by lyxia on 15/6/10.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import "EMStartVC.h"
#import "EMViewControllerManager.h"
#import "EMAppContext.h"

@interface EMStartVC ()

@end

@implementation EMStartVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //验证自动登陆
    //显示开启界面至少3秒
    [self performSelector:@selector(chooseNextVC) withObject:nil afterDelay:3.0];
}

- (void)chooseNextVC
{
    if ([EMAppContext shareInstance].isNewVersion) {//第一次使用该版本
        //显示新版本特性界面
        [[EMViewControllerManager shareInstance] presentViewControllerByName:[EMNewfeatureVC className] animationType:VCTransitionAnimationTypeAllLeft data:nil];
    }
    else if([EMAppContext shareInstance].userState == UserStateOnLine){//已经自动登陆
        //显示主界面
        [[EMViewControllerManager shareInstance] presentViewControllerByName:[EMMainTabVC className] animationType:VCTransitionAnimationTypeAllLeft data:nil];
    }
    else {
        //显示登陆界面
        [[EMViewControllerManager shareInstance] presentViewControllerByName:[EMLoginVC className] animationType:VCTransitionAnimationTypeAllLeft data:nil];
    }
}

@end
