//
//  EMPanelManager.h
//  EMedicine
//
//  Created by lyxia on 15/6/11.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "EMContainerViewController.h"
#import "EMStartVC.h"
#import "EMLoginVC.h"
#import "EMNewfeatureVC.h"
#import "EMForgetPasswordVC.h"
#import "EMRegisterVC.h"
#import "EMMainTabVC.h"

#import "NSObject+EMExtension.h"
#import "VCTransitionUtil.h"

@interface EMViewControllerManager : NSObject

- (BOOL)presentViewControllerByName:(NSString *)viewControllerName data:(id)data;
- (BOOL)presentViewControllerByName:(NSString *)viewControllerName animationType:(VCTransitionAnimationType)animationType data:(id)data;
- (BOOL)dismissViewController;
- (BOOL)dismissViewController:(VCTransitionAnimationType)animationType;

+ (instancetype)shareInstance;

@property (nonatomic, readonly) EMContainerViewController *rootViewController;

@end
