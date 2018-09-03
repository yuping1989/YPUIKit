//
//  UIView+YPProgress.h
//  HuoQiuJiZhang-plus
//
//  Created by 喻平 on 2017/11/19.
//  Copyright © 2017年 com.huoqiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface UIView (YPProgress) <MBProgressHUDDelegate>

+ (void)showProgressOnWindowWithText:(NSString *)text;
+ (void)hideProgress;

/**
 *  显示等待提示框
 */
- (void)showProgressWithText:(NSString *)text;
- (void)showProgressOnWindowWithText:(NSString *)text;
- (void)showProgressOnView:(UIView *)view text:(NSString *)text userInteractionEnabled:(BOOL)enabled;
- (void)hideProgress;

// 在最上层的UIWindow上显示一个简短的提示，不会被键盘遮挡
+ (void)showToast:(NSString *)text;
+ (void)showToast:(NSString *)text
   hideAfterDelay:(NSTimeInterval)delay;

// 在最底层UIWindow上显示一个简短的提示，有键盘存在时，可能会被遮挡
+ (void)showToastOnAppWindow:(NSString *)text;

+ (void)showToast:(NSString *)text
           inView:(UIView *)view
   hideAfterDelay:(NSTimeInterval)delay;

- (void)setProgressHUD:(MBProgressHUD *)progressHUD;
- (MBProgressHUD *)progressHUD;

@end
