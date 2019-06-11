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
    if (!self.progressHUD) {
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

#pragma mark - Toast

+ (MBProgressHUD *)showSuccessToast:(NSString *)text {
    return [UIView showSuccessToast:text
                     hideAfterDelay:1.5f];
}

+ (MBProgressHUD *)showInfoToast:(NSString *)text {
    return [UIView showInfoToast:text
                  hideAfterDelay:1.5f];
}

+ (MBProgressHUD *)showErrorToast:(NSString *)text {
    return [UIView showErrorToast:text
                   hideAfterDelay:1.5f];
}

+ (MBProgressHUD *)showSuccessToast:(NSString *)text
                     hideAfterDelay:(NSTimeInterval)delay {
    UIImage *image = [[UIImage imageNamed:@"YPProgress.bundle/success"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    return [UIView showToast:text
                       image:image
              hideAfterDelay:delay];
}

+ (MBProgressHUD *)showInfoToast:(NSString *)text
                  hideAfterDelay:(NSTimeInterval)delay {
    UIImage *image = [[UIImage imageNamed:@"YPProgress.bundle/info"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    return [UIView showToast:text
                       image:image
              hideAfterDelay:delay];
}

+ (MBProgressHUD *)showErrorToast:(NSString *)text
                   hideAfterDelay:(NSTimeInterval)delay {
    UIImage *image = [[UIImage imageNamed:@"YPProgress.bundle/error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    return [UIView showToast:text
                       image:image
              hideAfterDelay:delay];
}

+ (MBProgressHUD *)showToastOnAppWindow:(NSString *)text {
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    return [UIView showToast:text
                       image:nil
                      inView:window
              hideAfterDelay:1.5f];
}

+ (MBProgressHUD *)showToast:(NSString *)text {
    return [UIView showToast:text hideAfterDelay:1.5f];
}

+ (MBProgressHUD *)showToast:(NSString *)text
              hideAfterDelay:(NSTimeInterval)delay {
    return [UIView showToast:text image:nil hideAfterDelay:delay];
}

+ (MBProgressHUD *)showToast:(NSString *)text
                       image:(UIImage *)image
              hideAfterDelay:(NSTimeInterval)delay {
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    return [UIView showToast:text
                       image:image
                      inView:window
              hideAfterDelay:delay];
}

+ (MBProgressHUD *)showToast:(NSString *)text
                       image:(UIImage *)image
                      inView:(UIView *)view
              hideAfterDelay:(NSTimeInterval)delay {
    MBProgressHUD *hud = [self toastHUDAddedTo:view
                                          text:text
                                hideAfterDelay:delay];
    if (image) {
        hud.mode = MBProgressHUDModeCustomView;
        hud.customView = [[UIImageView alloc] initWithImage:image];
        hud.square = YES;
    } else {
        hud.mode = MBProgressHUDModeText;
    }
    return hud;
}

+ (MBProgressHUD *)toastHUDAddedTo:(UIView *)view
                              text:(NSString *)text
                    hideAfterDelay:(NSTimeInterval)delay {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.color = [UIColor colorWithWhite:0.15f alpha:1];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.contentColor = [UIColor whiteColor];
    hud.margin = 12.f;
    hud.center = view.center;
    hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = NO;
    hud.label.text = text;
    [hud hideAnimated:YES afterDelay:delay];
    return hud;
}

@end
