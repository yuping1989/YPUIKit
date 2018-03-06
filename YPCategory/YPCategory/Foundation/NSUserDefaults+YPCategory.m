//
//  NSUserDefaults+YPCategory.m
//  YPCategory
//
//  Created by 喻平 on 16/10/12.
//  Copyright © 2016年 YPCategory. All rights reserved.
//

#import "NSUserDefaults+YPCategory.h"

@implementation NSUserDefaults (YPCategory)

+ (void)saveInBlock:(void (^)(NSUserDefaults *ud))block {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (block) {
        block(userDefaults);
    }
    [userDefaults synchronize];
}

@end
