//
//  EMContainerViewController.h
//  EMedicine
//
//  Created by lyxia on 15/6/13.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCTransitionUtil.h"

@interface EMContainerViewController : UIViewController

@property (nonatomic, weak) UIViewController *currentViewcController;

- (instancetype)initWithRootController:(UIViewController *)viewController;

- (void)swapCurrentControllerWith:(UIViewController*)viewController animationType:(VCTransitionAnimationType)animationsType data:(id)data;

@end
