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

/**
 *  显示等待提示框
 */
- (void)showProgressWithText:(NSString *)text;
- (void)showProgressOnWindowWithText:(NSString *)text;
- (void)showProgressOnView:(UIView *)view text:(NSString *)text userInteractionEnabled:(BOOL)enabled;
- (void)hideProgress;

- (void)setProgressHUD:(MBProgressHUD *)progressHUD;
- (MBProgressHUD *)progressHUD;

@end
