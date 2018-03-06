//
//  NSDate+YPCategory.h
//  YPCategory
//
//  Created by 喻平 on 2017/10/24.
//  Copyright © 2017年 YPCategory. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  日期格式
 */
extern NSString *const YPDateFormat_yyyyMMddHHmmss;
extern NSString *const YPDateFormat_yyyyMMddHHmm;
extern NSString *const YPDateFormat_yyyyMMdd;
extern NSString *const YPDateFormat_yyMMddHHmm;
extern NSString *const YPDateFormat_MMddHHmm;
extern NSString *const YPDateFormat_MMdd;

@interface NSDate (YPCategory)

@property (nonatomic, readonly) NSInteger weekday;

+ (NSString *)stringWithTimeInterval:(NSTimeInterval)time format:(NSString *)format;

+ (NSString *)stringWithNumber:(NSNumber *)number format:(NSString *)format;

- (NSString *)stringWithFormat:(NSString *)format;
- (NSString *)stringWithFormat:(NSString *)format
                      timeZone:(NSTimeZone *)timeZone
                        locale:(NSLocale *)locale;

+ (NSDate *)dateWithString:(NSString *)dateString format:(NSString *)format;

+ (NSString *)formatDateNumber:(NSNumber *)numbe;
+ (NSString *)formatDateTimeInterval:(NSTimeInterval)timeInterval;

@end
