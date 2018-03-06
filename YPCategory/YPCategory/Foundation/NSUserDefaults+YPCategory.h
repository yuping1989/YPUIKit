//
//  NSUserDefaults+YPCategory.h
//  YPCategory
//
//  Created by 喻平 on 16/10/12.
//  Copyright © 2016年 YPCategory. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (YPCategory)

+ (void)saveInBlock:(void (^)(NSUserDefaults *ud))block;

@end
