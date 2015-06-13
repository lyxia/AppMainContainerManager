//
//  EMContainerViewController.m
//  EMedicine
//
//  Created by lyxia on 15/6/13.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import "EMContainerViewController.h"
#import "VCTransitionUtil.h"

@interface EMContainerViewController ()
@end

@implementation EMContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (instancetype)initWithRootController:(UIViewController *)viewController
{
    if (self = [super init]) {
        [self presentDetailController:viewController];
    }
    return self;
}

- (void)presentDetailController:(UIViewController *)viewController
{
    if (self.currentViewcController) {
        [self removeCurrentDetailViewController];
    }
    
    //1. Add the viewController as child of the container
    [self addChildViewController:viewController];
    
    //2. Define the viewController's view size
    viewController.view.frame = [self frameForDetailController];
    
    //3. Add the viewController's view to the Container's view and save a reference to the viewController
    [self.view addSubview:viewController.view];
    self.currentViewcController = viewController;
    
    //4. Complete the add flow calling the function didMoveToParentViewController
    [viewController didMoveToParentViewController:self];

}

- (void)removeCurrentDetailViewController
{
    //1. Call the willMoveToParentViewController with nil
    //   This is the last method where your currentViewController can perform some operations before neing removed
    [self.currentViewcController willMoveToParentViewController:nil];
    
    //2. Remove the currentViewController's view from the Container
    [self.currentViewcController.view removeFromSuperview];
    
    //3. Update the hierarchy"
    //   Automatically the method didMoveToParentViewController: will be called on the currentViewController)
    [self.currentViewcController removeFromParentViewController];

}

- (void)swapCurrentControllerWith:(UIViewController *)viewController animationType:(VCTransitionAnimationType)animationsType data:(id)data
{
    if (self.currentViewcController == viewController) {
        return;
    }
    
    //The current controller is going to be removed
    [self.currentViewcController willMoveToParentViewController:nil];
    
    //The new controller is a new child of the container
    [self addChildViewController:viewController];
    
    //play swap animation
    [VCTransitionUtil transitionFromViewController:self.currentViewcController toViewController:viewController animationType:animationsType duration:0.3 completion:^(BOOL finished) {
        if (!finished) {
            [self.currentViewcController.view removeFromSuperview];
            [self.view addSubview:viewController.view];
        }
        
        //Remove the old  viewController from the hierarchy
        [self.currentViewcController removeFromParentViewController];

        //Set the new view controller as current
        self.currentViewcController = viewController;
        [self.currentViewcController didMoveToParentViewController:self];
        
    }];
}

- (CGRect)frameForDetailController{
    CGRect frame = self.view.bounds;
    return frame;
}

@end
