//
//  UIView+YPToast.h
//  YPUIKit
//
//  Created by 喻平 on 2018/8/19.
//  Copyright © 2018年 com.yp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YPToast)

// 在最上层的UIWindow上显示一个简短的提示，不会被键盘遮挡
+ (void)showToast:(NSString *)text;
+ (void)showToast:(NSString *)text
   hideAfterDelay:(NSTimeInterval)delay;

// 在最底层UIWindow上显示一个简短的提示，有键盘存在时，可能会被遮挡
+ (void)showToastOnAppWindow:(NSString *)text;

+ (void)showToast:(NSString *)text
           inView:(UIView *)view
   hideAfterDelay:(NSTimeInterval)delay;

@end
