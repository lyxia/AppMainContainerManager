//
//  VCTransitionUtil.m
//  EMedicine
//
//  Created by lyxia on 15/6/10.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import "VCTransitionUtil.h"
#import "EMViewControllerManager.h"
#import "UIView+EMExtension.h"

@implementation VCTransitionUtil

+ (void)transitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC animationType:(VCTransitionAnimationType)animationType duration:(NSTimeInterval)duration completion:(void (^)(BOOL))completion
{
    NSAssert(fromVC && toVC, @"nil value");
    NSAssert([fromVC isViewLoaded] && fromVC.parentViewController && fromVC.view.superview, @"fromVC not appear");
    NSAssert(!toVC.view || !toVC.view.superview, @"toVC already appear");
    
    if (!toVC.parentViewController) {
        [fromVC.parentViewController addChildViewController:toVC];
    }
    NSAssert(fromVC.parentViewController == toVC.parentViewController, @"not a common parentViewController");
    
    [self transitionWithParentVC:fromVC.parentViewController fromVC:fromVC toVC:toVC animationType:animationType duration:duration completion:completion];
}

+ (void)transitionWithParentVC:(UIViewController *)parentVC fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC animationType:(VCTransitionAnimationType)animationType duration:(NSTimeInterval)duration completion:(void (^)(BOOL))completion
{
    [parentVC.view addSubview:toVC.view];
    
    //移除了fromVC的superView
    //没有移除fromVC的parentViewController
    if (animationType == VCTransitionAnimationTypeNo) {
        [fromVC.view removeFromSuperview];
        completion ? completion(YES) : nil;
        return;
    }
    
    [parentVC.view setUserInteractionEnabled:NO];
    [self beforeTrasition:animationType fromView:fromVC.view toView:toVC.view parentView:parentVC.view];
    [UIView animateWithDuration:duration animations:^{
        [self transitionAnimations:animationType fromView:fromVC.view toView:toVC.view parentView:parentVC.view];
    } completion:^(BOOL finished) {
        fromVC.view.x = 0;
        fromVC.view.y = 0;
        toVC.view.x = 0;
        toVC.view.y = 0;
        [parentVC.view setUserInteractionEnabled:YES];
        
        [fromVC.view removeFromSuperview];
        
        completion ? completion(finished) : nil;
    }];
}

+ (void)beforeTrasition:(VCTransitionAnimationType)animationType fromView:(UIView *)fromView toView:(UIView *)toView parentView:(UIView *)parentView
{
    switch (animationType) {
        case VCTransitionAnimationTypeDismissBottom:
        case VCTransitionAnimationTypeDismissRight:
        case VCTransitionAnimationTypeNo:
            break;
        case VCTransitionAnimationTypeLeft:
        case VCTransitionAnimationTypeAllLeft:
            toView.x = toView.width;
            break;
        case VCTransitionAnimationTypeTop:
            toView.y = toView.height;
            break;
    }
}

+ (void)transitionAnimations:(VCTransitionAnimationType)animationType fromView:(UIView *)fromView toView:(UIView *)toView parentView:(UIView *)parentView
{
    switch (animationType) {
        case VCTransitionAnimationTypeNo:
            break;
        case VCTransitionAnimationTypeLeft:
            toView.x = 0;
            break;
        case VCTransitionAnimationTypeAllLeft:
            toView.x = 0;
            fromView.x = -fromView.width;
            break;
        case VCTransitionAnimationTypeTop:
            toView.y = 0;
            break;
        case VCTransitionAnimationTypeDismissBottom:
            fromView.y = fromView.height;
            [parentView addSubview:fromView];
            break;
        case VCTransitionAnimationTypeDismissRight:
            fromView.x = fromView.width;
            [parentView addSubview:fromView];
            break;
    }
}

@end
