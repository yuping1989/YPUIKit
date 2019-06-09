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

+ (void)showProgressOnWindow {
    [self showProgressOnWindowWithText:nil];
}

+ (void)showProgressOnWindowWithText:(NSString *)text {
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    [window showProgressOnView:window text:text userInteractionEnabled:YES];
}

+ (void)hideProgress {
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    [window hideProgress];
}

#pragma mark - ProgressHUD

- (void)showProgress {
    [self showProgressWithText:nil];
}

- (void)showProgressWithText:(NSString *)text {
    [self showProgressOnView:self text:text userInteractionEnabled:YES];
}

- (void)showProgressOnWindowWithText:(NSString *)text {
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
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
    
    NSLog(@"show progress");
}

- (void)hideProgress {
    if (self.progressHUD) {
        return;
    }
    [self.progressHUD hideAnimated:YES];
    self.progressHUD = nil;
    NSLog(@"hide progress");
}

- (MBProgressHUD *)progressHUD {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setProgressHUD:(MBProgressHUD *)progressHUD {
    objc_setAssociatedObject(self, @selector(progressHUD), progressHUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)showToast:(NSString *)text {
    [UIView showToast:text hideAfterDelay:1.5f];
}

+ (void)showToastOnAppWindow:(NSString *)text {
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    [UIView showToast:text inView:window hideAfterDelay:1.5f];
}

+ (void)showToast:(NSString *)text hideAfterDelay:(NSTimeInterval)delay {
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [UIView showToast:text inView:window hideAfterDelay:delay];
}

+ (void)showToast:(NSString *)text
           inView:(UIView *)view
   hideAfterDelay:(NSTimeInterval)delay {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.bezelView.color = [UIColor colorWithWhite:0.15f alpha:1];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.contentColor = [UIColor whiteColor];
    hud.label.text = text;
    hud.margin = 10.f;
    hud.center = view.center;
    hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = NO;
    [hud hideAnimated:YES afterDelay:delay];
}

@end
