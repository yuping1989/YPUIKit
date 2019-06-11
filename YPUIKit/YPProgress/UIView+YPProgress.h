//
//  UIView+YPProgress.h
//  HuoQiuJiZhang-plus
//
//  Created by 喻平 on 2017/11/19.
//  Copyright © 2017年 com.huoqiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface UIView (YPProgress)

+ (void)showProgressOnWindow;
+ (void)showProgressOnWindowWithText:(NSString *)text;
+ (void)hideProgress;

/**
 *  显示等待提示框
 */
- (void)showProgress;
- (void)showProgressWithText:(NSString *)text;
- (void)showProgressOnWindowWithText:(NSString *)text;
- (void)showProgressOnView:(UIView *)view text:(NSString *)text userInteractionEnabled:(BOOL)enabled;
- (void)hideProgress;

#pragma mark - Toast

+ (MBProgressHUD *)showSuccessToast:(NSString *)text;
+ (MBProgressHUD *)showInfoToast:(NSString *)text;
+ (MBProgressHUD *)showErrorToast:(NSString *)text;

+ (MBProgressHUD *)showSuccessToast:(NSString *)text
                     hideAfterDelay:(NSTimeInterval)delay;
+ (MBProgressHUD *)showInfoToast:(NSString *)text
                  hideAfterDelay:(NSTimeInterval)delay;
+ (MBProgressHUD *)showErrorToast:(NSString *)text
                   hideAfterDelay:(NSTimeInterval)delay;

// 在最底层UIWindow上显示一个简短的提示，有键盘存在时，可能会被遮挡
+ (MBProgressHUD *)showToastOnAppWindow:(NSString *)text;

// 在最上层的UIWindow上显示一个简短的提示，不会被键盘遮挡
+ (MBProgressHUD *)showToast:(NSString *)text;
+ (MBProgressHUD *)showToast:(NSString *)text
              hideAfterDelay:(NSTimeInterval)delay;
+ (MBProgressHUD *)showToast:(NSString *)text
                       image:(UIImage *)image
              hideAfterDelay:(NSTimeInterval)delay;
+ (MBProgressHUD *)showToast:(NSString *)text
                       image:(UIImage *)image
                      inView:(UIView *)view
              hideAfterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)toastHUDAddedTo:(UIView *)view
                              text:(NSString *)text
                    hideAfterDelay:(NSTimeInterval)delay;

- (void)setProgressHUD:(MBProgressHUD *)progressHUD;
- (MBProgressHUD *)progressHUD;

@end
