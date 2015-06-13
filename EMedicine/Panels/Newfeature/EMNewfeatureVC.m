//
//  EMNewfeatureVC.m
//  EMedicine
//
//  Created by lyxia on 15/6/10.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import "EMNewfeatureVC.h"
#import "EMViewControllerManager.h"
#import "EMAppContext.h"

@interface EMNewfeatureVC ()

@end

@implementation EMNewfeatureVC
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [EMAppContext shareInstance].isNewVersion = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       //模拟新特性播放完毕
        if([EMAppContext shareInstance].userState == UserStateOnLine){//已经自动登陆
            //显示主界面
            [[EMViewControllerManager shareInstance] presentViewControllerByName:[EMMainTabVC className] animationType:VCTransitionAnimationTypeAllLeft data:nil];
        }
        else {
            //显示登陆界面
            [[EMViewControllerManager shareInstance] presentViewControllerByName:[EMLoginVC className] animationType:VCTransitionAnimationTypeAllLeft data:nil];
        }
    });
}

@end
