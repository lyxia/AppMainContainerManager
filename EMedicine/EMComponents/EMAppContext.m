//
//  EMAppContext.m
//  EMedicine
//
//  Created by lyxia on 15/6/10.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import "EMAppContext.h"

@implementation EMAppContext
+ (instancetype)shareInstance
{
    static EMAppContext *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EMAppContext alloc] init];
        sharedInstance.isNewVersion = YES;
        sharedInstance.userState = UserStateOffLine;
    });
    return sharedInstance;
}

- (BOOL)isNewVersion
{
    BOOL origin = _isNewVersion;
    _isNewVersion = NO;
    return origin;
}

@end
