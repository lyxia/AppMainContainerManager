//
//  EMAppContext.h
//  EMedicine
//
//  Created by lyxia on 15/6/10.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, UserState) {
    UserStateOnLine,
    UserStateOffLine
};

@interface EMAppContext : NSObject
@property (nonatomic, assign) UserState userState;
@property (nonatomic, assign) BOOL isNewVersion;
+ (instancetype)shareInstance;
@end
