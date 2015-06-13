//
//  EMMainTabVC.m
//  EMedicine
//
//  Created by lyxia on 15/6/11.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import "EMMainTabVC.h"

@interface EMMainTabVC ()

@end

@implementation EMMainTabVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"EMMain" bundle:nil];
    UIViewController *nv = (UINavigationController *)[storyboard instantiateInitialViewController];
    [self addChildViewController:nv];
    [self.view addSubview:nv.view];
}

@end
