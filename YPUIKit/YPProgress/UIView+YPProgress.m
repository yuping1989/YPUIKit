//
//  UIView+YPProgress.m
//  HuoQiuJiZhang-plus
//
//  Created by 喻平 on 2017/11/19.
//  Copyright © 2017年 com.huoqiu. All rights reserved.
//

#import "UIView+YPProgress.h"
#import <objc/runtime.h>

@implementation UIView (YPProgress)

+ (void)showProgress {
    [self showProgressWithText:nil];
}

+ (void)showProgressWithText:(NSString *)text {
    UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
    [window showProgressOnView:window text:text userInteractionEnabled:YES];
}

+ (void)hideProgress {
    UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
    [window hideProgress];
}

+ (void)hideAllProgress {
    for (UIWindow *window in [UIApplication sharedApplication].windows) {
        if (window.progressHUD) {
            [window hideProgress];
        }
    }
}

+ (void)showProgressOnLastWindow {
    [self showProgressWithText:nil];
}

+ (void)showProgressOnLastWindowWithText:(NSString *)text {
    UIWindow *window = [self lastWindow];
    [window showProgressOnView:window text:text userInteractionEnabled:YES];
}

+ (void)hideProgressOnLastWindow {
    UIWindow *window = [self lastWindow];
    [window hideProgress];
}

+ (UIWindow *)lastWindow {
    for (UIWindow *window in [UIApplication sharedApplication].windows.reverseObjectEnumerator) {
        if ([window isKindOfClass:[UIWindow class]] &&
            CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds)) {
            return window;
        }
    }
    return [UIApplication sharedApplication].keyWindow;
}

#pragma mark - ProgressHUD

- (void)showProgress {
    [self showProgressWithText:nil];
}

- (void)showProgressWithText:(NSString *)text {
    [self showProgressOnView:self text:text userInteractionEnabled:YES];
}

- (void)showProgressOnWindowWithText:(NSString *)text {
    UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
    [self showProgressOnView:window text:text userInteractionEnabled:YES];
}

- (void)showProgressOnView:(UIView *)view text:(NSString *)text userInteractionEnabled:(BOOL)enabled {
    if (!self.progressHUD) {
        self.progressHUD = [[MBProgressHUD alloc] initWithView:view];
        self.progressHUD.bezelView.color = [UIColor colorWithWhite:0.15f alpha:1];
        self.progressHUD.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        self.progressHUD.contentColor = [UIColor whiteColor];
        self.progressHUD.label.textColor = [UIColor whiteColor];
        [self.progressHUD showAnimated:YES];
        [view addSubview:self.progressHUD];
    }
    self.progressHUD.label.text = text;
    self.progressHUD.userInteractionEnabled = enabled;
}

- (void)hideProgress {
    if (!self.progressHUD) {
        return;
    }
    [self.progressHUD hideAnimated:YES];
    self.progressHUD = nil;
}

- (MBProgressHUD *)progressHUD {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setProgressHUD:(MBProgressHUD *)progressHUD {
    objc_setAssociatedObject(self, @selector(progressHUD), progressHUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
