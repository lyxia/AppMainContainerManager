//
//  EMForgetPassword3.m
//  EMedicine
//
//  Created by lyxia on 15/6/11.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import "EMForgetPassword3.h"
#import "EMViewControllerManager.h"

@interface EMForgetPassword3 ()

@end

@implementation EMForgetPassword3

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)Complete:(UIBarButtonItem *)sender {
    [[EMViewControllerManager shareInstance] dismissViewController];
}

- (IBAction)back:(UIBarButtonItem *)sender {
    [[EMViewControllerManager shareInstance] dismissViewController];
}

@end
