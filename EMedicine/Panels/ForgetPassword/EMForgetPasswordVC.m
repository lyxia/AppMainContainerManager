//
//  EMForgetPasswordVC.m
//  EMedicine
//
//  Created by lyxia on 15/6/11.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import "EMForgetPasswordVC.h"

@interface EMForgetPasswordVC ()

@end

@implementation EMForgetPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"EMForgetPassWord" bundle:nil];
    UINavigationController *nv = (UINavigationController *)[storyboard instantiateInitialViewController];
    [self addChildViewController:nv];
    [self.view addSubview:nv.view];
}
@end
