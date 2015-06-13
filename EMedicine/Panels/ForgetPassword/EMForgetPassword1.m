//
//  EMForgetPassword1.m
//  EMedicine
//
//  Created by lyxia on 15/6/11.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import "EMForgetPassword1.h"
#import "EMViewControllerManager.h"

@interface EMForgetPassword1 ()

@end

@implementation EMForgetPassword1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)back:(UIBarButtonItem *)sender {
    [[EMViewControllerManager shareInstance] dismissViewController];
}

@end
