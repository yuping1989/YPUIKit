//
//  UIView+YPToast.m
//  YPUIKit
//
//  Created by 喻平 on 2018/8/19.
//  Copyright © 2018年 com.yp. All rights reserved.
//

#import "UIView+YPToast.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation UIView (YPToast)

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
    
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.margin = 10.f;
    hud.center = view.center;
    hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = NO;
    [hud hideAnimated:YES afterDelay:delay];
}

@end
