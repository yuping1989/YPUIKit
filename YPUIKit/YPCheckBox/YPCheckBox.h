//
//  YPCheckBox.h
//  ;;
//
//  Created by 喻平 on 13-12-20.
//  Copyright (c) 2013年 com.huoqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YPCheckBox;

@protocol YPCheckBoxDelegate <NSObject>

@optional

- (BOOL)ypCheckBox:(YPCheckBox *)checkBox stateWillChange:(BOOL)checked;
- (void)ypCheckBox:(YPCheckBox *)checkBox stateDidChanged:(BOOL)checked;

@end

@interface YPCheckBox : UIButton

@property (nonatomic, strong) UIImage *normalImage UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIImage *checkedImage UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) BOOL checked;
@property (nonatomic, assign) IBInspectable CGFloat spacingInImageAndTitle;
@property (nonatomic, assign) IBInspectable CGFloat imageMarginLeft;

@property(nonatomic, weak) IBOutlet id<YPCheckBoxDelegate> delegate;

@property (nonatomic, copy) BOOL (^stateWillChangeBlock)(BOOL checked);
@property (nonatomic, copy) void (^stateDidChangeBlock)(BOOL checked);

+ (id)checkBoxWithFrame:(CGRect)frame;

- (void)setChecked:(BOOL)checked callDelegate:(BOOL)callDelegate;

- (void)setNormalImage:(UIImage *)normalImage checkedImage:(UIImage *)checkedImage;

@end
