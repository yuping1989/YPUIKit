//
//  UIView+YPProgress.m
//  HuoQiuJiZhang-plus
//
//  Created by 喻平 on 2017/11/19.
//  Copyright © 2017年 com.huoqiu. All rights reserved.
//

#import "UIView+YPProgress.h"
#import <objc/runtime.h>

@interface YPToastConfig ()


@end

@implementation YPToastConfig

- (instancetype)init {
    self = [super init];
    if (self) {
        self.duration = 1.5f;
        self.type = YPToastModeText;
        self.inFirstWindow = NO;
    }
    return self;
}

- (void)setType:(YPToastMode)type {
    _type = type;
    NSString *name;
    if (type == YPToastModeSuccess) {
        name = @"success";
    } else if (type == YPToastModeInfo) {
        name = @"info";
    } else if (type == YPToastModeError) {
        name = @"error";
    }
    self.image = [[UIImage imageNamed:[NSString stringWithFormat:@"YPUIKit.bundle/%@", name]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

- (void)setInFirstWindow:(BOOL)inFirstWindow {
    _inFirstWindow = inFirstWindow;
    if (inFirstWindow) {
        self.inView = [UIApplication sharedApplication].windows.firstObject;
    } else {
        self.inView = [UIApplication sharedApplication].windows.lastObject;
    }
}

@end

@implementation UIView (YPProgress)

+ (void)showProgressOnWindow {
    [self showProgressOnWindowWithText:nil];
}

+ (void)showProgressOnWindowWithText:(NSString *)text {
    UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
    [window showProgressOnView:window text:text userInteractionEnabled:YES];
}

+ (void)hideProgress {
    UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
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
    return [self showToast:text config:^(YPToastConfig *config) {
        config.type = YPToastModeSuccess;
    }];
}

+ (MBProgressHUD *)showInfoToast:(NSString *)text {
    return [self showToast:text config:^(YPToastConfig *config) {
        config.type = YPToastModeInfo;
    }];
}

+ (MBProgressHUD *)showErrorToast:(NSString *)text {
    return [self showToast:text config:^(YPToastConfig *config) {
        config.type = YPToastModeError;
    }];
}

+ (MBProgressHUD *)showToast:(NSString *)text {
    return [self showToast:text config:nil];
}

+ (MBProgressHUD *)showToast:(NSString *)text
                      config:(void (^)(YPToastConfig *config))configBlock {
    YPToastConfig *config = [[YPToastConfig alloc] init];
    if (configBlock) {
        configBlock(config);
    }
    MBProgressHUD *hud = [self toastHUDAddedTo:config.inView
                                          text:text
                                hideAfterDelay:config.duration];
    if (config.image) {
        hud.mode = MBProgressHUDModeCustomView;
        hud.customView = [[UIImageView alloc] initWithImage:config.image];
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
