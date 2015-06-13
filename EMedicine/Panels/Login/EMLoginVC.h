//
//  EMLoginVC.h
//  EMedicine
//
//  Created by lyxia on 15/6/10.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMLoginVC : UIViewController
@property (nonatomic, copy) void(^loginSuccess)(void);
@end
