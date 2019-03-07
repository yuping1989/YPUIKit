//
//  UIView+YPLine.m
//  YPUIKit
//
//  Created by 喻平 on 2019/3/6.
//  Copyright © 2019年 com.yp. All rights reserved.
//

#import "UIView+YPLine.h"
#import <Masonry/MASViewConstraint.h>

static const NSInteger YPLineTag = 1000000;

@implementation UIView (YPLine)

- (UIView *)addTopLineWithColor:(UIColor *)color {
    return [self addTopLineWithColor:color paddingLeft:0];
}

- (UIView *)addTopLineWithColor:(UIColor *)color
                    paddingLeft:(CGFloat)paddingLeft {
    return [self addLine:YPLineTypeTop
                   color:color
                 leading:paddingLeft
                trailing:0];
}

- (UIView *)addBottomLineWithColor:(UIColor *)color {
    return [self addBottomLineWithColor:color paddingLeft:0];
}

- (UIView *)addBottomLineWithColor:(UIColor *)color
                       paddingLeft:(CGFloat)paddingLeft {
    return [self addLine:YPLineTypeBottom
                   color:color
                 leading:paddingLeft
                trailing:0];
}

- (UIView *)addLine:(YPLineType)type color:(UIColor *)color leading:(CGFloat)leading trailing:(CGFloat)trailing {
    return [self addLine:type
                   color:color
                   align:0
                 leading:leading
                trailing:trailing
               thickness:[self onePixel]];
}

- (UIView *)addLine:(YPLineType)type
              color:(UIColor *)color
              align:(CGFloat)align
            leading:(CGFloat)leading
           trailing:(CGFloat)trailing
          thickness:(CGFloat)thickness {
    void (^block)(MASConstraintMaker *make) = ^(MASConstraintMaker *make) {
        switch (type) {
            case YPLineTypeLeft:
                make.left.equalTo(self).offset(align);
                make.top.equalTo(self).offset(leading);
                make.bottom.equalTo(self).offset(-trailing);
                make.width.mas_equalTo(thickness);
                break;
            case YPLineTypeTop:
                make.top.equalTo(self).offset(align);
                make.left.equalTo(self).offset(leading);
                make.right.equalTo(self).offset(-trailing);
                make.height.mas_equalTo(thickness);
                break;
            case YPLineTypeRight:
                make.right.equalTo(self).offset(-align);
                make.top.equalTo(self).offset(leading);
                make.bottom.equalTo(self).offset(-trailing);
                make.width.mas_equalTo(thickness);
                break;
            case YPLineTypeBottom:
                make.bottom.equalTo(self).offset(-align);
                make.left.equalTo(self).offset(leading);
                make.right.equalTo(self).offset(-trailing);
                make.height.mas_equalTo(thickness);
                break;
        }
    };
    
    UIView *line = [self lineViewForType:type];
    if (line) {
        [line mas_remakeConstraints:block];
    } else {
        line = [[UIView alloc] init];
        line.tag = YPLineTag + type;
        [self addSubview:line];
        [line mas_makeConstraints:block];
    }
    line.backgroundColor = color;
    return line;
}

- (UIView *)lineViewForType:(YPLineType)type {
    return [self viewWithTag:YPLineTag + type];
}

- (CGFloat)onePixel {
    return 1.0f / [UIScreen mainScreen].nativeScale;
}

- (UIView *)addSubViewWithColor:(UIColor *)color
                      block:(void (^)(MASConstraintMaker *make))block {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = color;
    [self addSubview:view];
    [view mas_makeConstraints:block];
    return view;
}

@end
