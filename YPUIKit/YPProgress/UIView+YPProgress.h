//
//  UIView+YPProgress.h
//  HuoQiuJiZhang-plus
//
//  Created by 喻平 on 2017/11/19.
//  Copyright © 2017年 com.huoqiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

typedef NS_ENUM(NSInteger, YPToastMode) {
    YPToastModeText,
    YPToastModeSuccess,
    YPToastModeInfo,
    YPToastModeError
};

@interface YPToastConfig : NSObject

@property (nonatomic) YPToastMode mode;
@property (nonatomic) UIImage *image;
@property (nonatomic) CGFloat duration;
@property (nonatomic) UIView *inView;
@property (nonatomic) BOOL inFirstWindow;

@end


@interface UIView (YPProgress)

+ (void)showProgress;
+ (void)showProgressWithText:(NSString *)text;
+ (void)hideProgress;
+ (void)hideAllProgress;

+ (void)showProgressOnLastWindow;
+ (void)showProgressOnLastWindowWithText:(NSString *)text;
+ (void)hideProgressOnLastWindow;

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
+ (MBProgressHUD *)showToast:(NSString *)text;
+ (MBProgressHUD *)showToastOnAppWindow:(NSString *)text;

+ (MBProgressHUD *)showToast:(NSString *)text
                      config:(void (^)(YPToastConfig *config))configBlock;


+ (MBProgressHUD *)toastHUDAddedTo:(UIView *)view
                              text:(NSString *)text
                    hideAfterDelay:(NSTimeInterval)delay;

- (void)setProgressHUD:(MBProgressHUD *)progressHUD;
- (MBProgressHUD *)progressHUD;

@end
