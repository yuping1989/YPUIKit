//
//  YPToastView.h
//  本类的主要功能为显示一个Toast提示
//  采用了链式语法进行调用，一行代码即可实现多个参数的配置，且API简单易用
//
//  Created by 喻平 on 2020/3/5.
//  Copyright © 2020 migu. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 * 快捷调用方法
 */
#define YPTextToast(_text_) YPToast(_text_).show();
#define YPSuccessToast(_text_) YPToast(_text_).success().show();
#define YPErrorToast(_text_) YPToast(_text_).error().show();
#define YPInfoToast(_text_) YPToast(_text_).info().show();

// 基础调用方法，使用此方法，在需要调用.show()或者.showInView(view)方法
#define YPToast(_text_) [[YPToastView alloc] initWithText:_text_]

@interface YPToastView : UIView

@property (nonatomic) UIView *contentView;
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UILabel *textLabel;

@property (nonatomic, copy) NSString *text;
@property (nonatomic) UIImage *image;

@property (nonatomic) BOOL autoHide;

@property (nonatomic) UIFont *textFont UI_APPEARANCE_SELECTOR;
@property (nonatomic) CGFloat hideAfterDelay UI_APPEARANCE_SELECTOR;
@property (nonatomic) UIEdgeInsets insets UI_APPEARANCE_SELECTOR;
@property (nonatomic) CGFloat textImageSpace UI_APPEARANCE_SELECTOR;
@property (nonatomic) CGFloat maxWidth UI_APPEARANCE_SELECTOR;

- (instancetype)initWithText:(NSString *)text;

- (void)showInView:(UIView *)view;
- (void)hide;

@end

/*
 * 此分类主要定义Toast的快捷调用方法
 */
@interface YPToastView (Interface)

// 成功类型，图像是√
- (YPToastView *(^)(void))success;

// 失败类型，图像是X
- (YPToastView *(^)(void))error;

// 信息类型，图像是i
- (YPToastView *(^)(void))info;

// 提示icon
- (YPToastView *(^)(UIImage *image))icon;

// 显示时长
- (YPToastView *(^)(CGFloat num))duration;

// 在最后一个Window显示Toast
- (YPToastView *(^)(void))show;

// 在第一个Window显示Toast
- (YPToastView *(^)(void))showInFirstWindow;

// 指定view显示Toast
- (YPToastView *(^)(UIView *view))showInView;

@end
