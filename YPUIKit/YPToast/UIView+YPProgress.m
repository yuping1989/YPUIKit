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

+ (void)showProgressOnWindowWithText:(NSString *)text {
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [window showProgressOnView:window text:text userInteractionEnabled:YES];
}

+ (void)hideProgress {
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [window hideProgress];
}

#pragma mark - ProgressHUD

- (MBProgressHUD *)progressHUD {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setProgressHUD:(MBProgressHUD *)progressHUD {
    objc_setAssociatedObject(self, @selector(progressHUD), progressHUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showProgressWithText:(NSString *)text {
    [self showProgressOnView:self text:text userInteractionEnabled:YES];
}

- (void)showProgressOnWindowWithText:(NSString *)text {
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [self showProgressOnView:window text:text userInteractionEnabled:YES];
}

- (void)showProgressOnView:(UIView *)view text:(NSString *)text userInteractionEnabled:(BOOL)enabled {
    if (!self.progressHUD) {
        self.progressHUD = [[MBProgressHUD alloc] initWithView:view];
        [view addSubview:self.progressHUD];
        self.progressHUD.delegate = self;
        [self.progressHUD showAnimated:YES];
    }
    self.progressHUD.label.text = text;
    self.progressHUD.userInteractionEnabled = enabled;
    
    NSLog(@"show progress");
}

- (void)hudWasHidden:(MBProgressHUD *)hud {
    if (!self.progressHUD) {
        return;
    }
    [self.progressHUD removeFromSuperview];
    self.progressHUD = nil;
    NSLog(@"hide progress");
}

- (void)hideProgress {
    if (!self.progressHUD) {
        return;
    }
    [self.progressHUD hideAnimated:YES];
}

@end
