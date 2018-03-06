//
//  CALayer+YPCategory.h
//  YPCategory
//
//  Created by 喻平 on 14-7-21.
//  Copyright (c) 2014年 com.yp.YPCategory All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (YPCategory)

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

- (CGFloat)maxY;
- (CGFloat)maxX;

@end
