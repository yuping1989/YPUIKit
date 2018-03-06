//
//  UIScreen+YPCategory.m
//  YPCategory
//
//  Created by 喻平 on 16/6/23.
//  Copyright © 2016年 YPCategory. All rights reserved.
//

#import "UIScreen+YPCategory.h"

@implementation UIScreen (YPCategory)

+ (CGFloat)onePixel {
    UIScreen* mainScreen = [UIScreen mainScreen];
    if ([mainScreen respondsToSelector:@selector(nativeScale)]) {
        return 1.0f / mainScreen.nativeScale;
    } else {
        return 1.0f / mainScreen.scale;
    }
}

@end
