//
//  NSNumber+YPCategory.m
//  YPCategory
//
//  Created by 喻平 on 14-4-1.
//  Copyright (c) 2014年 com.yp.YPCategory All rights reserved.
//

#import "NSNumber+YPCategory.h"

@implementation NSNumber (YPCategory)
- (NSString *)toString {
    if ([@"0" isEqualToString:self.stringValue]) {
        return @"";
    } else {
        return self.stringValue;
    }
}

+ (NSNumber *)numberWithCurrentDate {
    return [NSNumber numberWithInt:[[NSDate date] timeIntervalSince1970]];
}
@end
