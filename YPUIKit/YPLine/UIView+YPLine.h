//
//  UIView+YPLine.h
//  YPUIKit
//
//  Created by 喻平 on 2019/3/6.
//  Copyright © 2019年 com.yp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

typedef NS_ENUM(NSInteger, YPLineType) {
    YPLineTypeLeft,
    YPLineTypeTop,
    YPLineTypeRight,
    YPLineTypeBottom,
};

@interface UIView (YPLine)

- (UIView *)addTopLineWithColor:(UIColor *)color;
- (UIView *)addTopLineWithColor:(UIColor *)color paddingLeft:(CGFloat)paddingLeft;

- (UIView *)addBottomLineWithColor:(UIColor *)color;
- (UIView *)addBottomLineWithColor:(UIColor *)color paddingLeft:(CGFloat)paddingLeft;

- (UIView *)addLine:(YPLineType)type
              color:(UIColor *)color
            leading:(CGFloat)leading
           trailing:(CGFloat)trailing;

- (UIView *)addLine:(YPLineType)type
              color:(UIColor *)color
              align:(CGFloat)align
            leading:(CGFloat)leading
           trailing:(CGFloat)trailing
          thickness:(CGFloat)thickness;

- (UIView *)lineViewForType:(YPLineType)type;

- (UIView *)addSubViewWithColor:(UIColor *)color
                          block:(void (^)(MASConstraintMaker *make))block;

@end
