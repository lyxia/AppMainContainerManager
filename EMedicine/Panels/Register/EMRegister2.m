//
//  EMForgetPassword2.m
//  EMedicine
//
//  Created by lyxia on 15/6/11.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import "EMRegister2.h"
#import "EMViewControllerManager.h"

@interface EMRegister2 ()

@end

@implementation EMRegister2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)back:(UIBarButtonItem *)sender {
    [[EMViewControllerManager shareInstance] dismissViewController];
}

@end
