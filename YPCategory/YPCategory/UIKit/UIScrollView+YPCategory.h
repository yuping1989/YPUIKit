//
//  UIScrollView+YPCategory.h
//  MGMobileMusic
//
//  Created by 喻平 on 2016/12/29.
//  Copyright © 2016年 migu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (YPCategory)

@property (nonatomic, strong, readonly) UIImageView *scalableHeaderImageView;

- (void)setScalableHeaderWithImage:(UIImage *)image
                     defaultHeight:(CGFloat)height
                         maskColor:(UIColor *)maskColor;

- (void)setScalableHeaderCustomView:(UIView *)customView;

@end