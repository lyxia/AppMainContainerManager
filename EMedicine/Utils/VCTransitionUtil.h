//
//  VCTransitionUtil.h
//  EMedicine
//
//  Created by lyxia on 15/6/10.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VCTransitionAnimationType) {
    VCTransitionAnimationTypeNo,
    VCTransitionAnimationTypeLeft,
    VCTransitionAnimationTypeAllLeft,
    VCTransitionAnimationTypeTop,
    VCTransitionAnimationTypeDismissBottom,
    VCTransitionAnimationTypeDismissRight
};

@interface VCTransitionUtil : NSObject
+ (void)transitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC animationType:(VCTransitionAnimationType)animationType duration:(NSTimeInterval)duration completion:(void (^)(BOOL))completion;
@end
