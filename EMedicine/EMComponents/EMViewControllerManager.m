//
//  EMPanelManager.m
//  EMedicine
//
//  Created by lyxia on 15/6/11.
//  Copyright (c) 2015年 lyxia. All rights reserved.
//

#import "EMViewControllerManager.h"

#import "EMAppContext.h"

#ifdef DEBUG
#import "OpenDebugGestureRecognizer.h"
#import "EMDebugVC.h"
#endif

@interface EMViewControllerManager()
@property (nonatomic, readwrite) EMContainerViewController *rootViewController;

@property (nonatomic, strong) NSMutableDictionary *viewControllerDic;
@property (nonatomic, strong) NSDictionary *savaDic;
@property (nonatomic, strong) NSMutableDictionary *preDic;
@end

@implementation EMViewControllerManager

#pragma mark - model present and dismiss
- (BOOL)presentViewControllerByName:(NSString *)viewControllerName data:(id)data
{
    return [self presentViewControllerByName:viewControllerName animationType:VCTransitionAnimationTypeTop data:data];
}

- (BOOL)presentViewControllerByName:(NSString *)viewControllerName animationType:(VCTransitionAnimationType)animationType data:(id)data
{
    UIViewController *viewController = [self viewControllerByName:viewControllerName];
    if (viewController) {
        NSString *preViewControllerName = [[self currentViewController] className];
        [self showViewController:viewController animationType:animationType data:data];
        [self.preDic setObject:preViewControllerName forKey:viewControllerName];
        return YES;
    }
    return NO;
}

- (BOOL)dismissViewController
{
    return [self dismissViewController:VCTransitionAnimationTypeDismissBottom];
}

- (BOOL)dismissViewController:(VCTransitionAnimationType)animationType
{
    NSString *viewControllerName = [[self currentViewController] className];
    NSString *preViewControllerName = [self.preDic objectForKey:viewControllerName];
    if (!preViewControllerName) {
        return NO;
    }
    UIViewController *preViewController = [self viewControllerByName:preViewControllerName];
    [self.preDic removeObjectForKey:viewControllerName];
    [self showViewController:preViewController animationType:animationType data:nil];
    return YES;
}

#pragma mark - private function
- (void)showViewController:(UIViewController *)viewController animationType:(VCTransitionAnimationType)animationType data:(id)data
{
    if([viewController respondsToSelector:@selector(setData:)])
    {
        [viewController performSelector:@selector(setData:) withObject:data];
    }
    
    [self.rootViewController swapCurrentControllerWith:viewController animationType:animationType data:data];
}

- (BOOL)hasViewControllerByName:(NSString *)viewControllerName
{
    if ([self.viewControllerDic objectForKey:viewControllerName]) {
        return YES;
    }
    return NO;
}

- (UIViewController *)viewControllerByName:(NSString *)viewControllerName
{
    UIViewController *viewController;
    if ([self hasViewControllerByName:viewControllerName]) {
        id viewContrllerInfo = [self.viewControllerDic objectForKey:viewControllerName];
        if (NSClassFromString(viewControllerName) == viewContrllerInfo) {
            NSAssert([(Class)viewContrllerInfo isSubclassOfClass:[UIViewController class]], @"%@ isn't kind of UIViewController",viewControllerName);
            viewController = [viewContrllerInfo new];
            [viewController.view setFrame:self.rootViewController.view.frame];
            if ([self.savaDic objectForKey:viewControllerName]) {
                 [self.viewControllerDic setValue:viewController forKey:viewControllerName];
            }
        } else {
            viewController = (UIViewController *)viewContrllerInfo;
        }
    }
    return viewController;
}

#pragma mark -init
+ (instancetype)shareInstance
{
    static EMViewControllerManager *shareInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[EMViewControllerManager alloc] init];
    });
    return shareInstance;
}

- (UIViewController *)rootViewController
{
    if (!_rootViewController) {
        _rootViewController = [[EMContainerViewController alloc] initWithRootController:[self startVC]];
        
#ifdef DEBUG
        OpenDebugGestureRecognizer *gestureRecognizer = [[OpenDebugGestureRecognizer alloc] initWithTarget:self action:@selector(openDebugVC)];
        [_rootViewController.view addGestureRecognizer:gestureRecognizer];
#endif

    }
    return _rootViewController;
}

#ifdef DEBUG
- (void)openDebugVC
{
    [self.rootViewController presentViewController:[EMDebugVC new] animated:YES completion:NULL];
}
#endif

- (UIViewController *)currentViewController
{
    return self.rootViewController.currentViewcController;
}

- (UIViewController *)startVC
{
    return [[EMStartVC alloc] init];
}

- (NSMutableDictionary *)viewControllerDic
{
    if (!_viewControllerDic) {
        NSDictionary *dic = @{
                               [EMLoginVC className] : [EMLoginVC class],
                               [EMNewfeatureVC className] : [EMNewfeatureVC class],
                               [EMMainTabVC className] : [EMMainTabVC class],
                               [EMForgetPasswordVC className] : [EMForgetPasswordVC class],
                               [EMRegisterVC className] : [EMRegisterVC class]
        };
        _viewControllerDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    }
    return _viewControllerDic;
}

- (NSDictionary *)savaDic
{
    if (!_savaDic) {
        _savaDic = @{
                     [EMLoginVC className] : @1,
                     [EMNewfeatureVC className] : @1,
                     [EMMainTabVC className] : @1
        };
    }
    return _savaDic;
}

- (NSMutableDictionary *)preDic
{
    if (!_preDic) {
        _preDic = [NSMutableDictionary dictionary];
    }
    return _preDic;
}

@end
