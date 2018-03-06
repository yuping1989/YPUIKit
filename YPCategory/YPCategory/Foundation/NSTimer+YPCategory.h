//
//  NSTimer+YPCategory.h
//  YPCategory
//
//  Created by 喻平 on 16/7/6.
//  Copyright © 2016年 YPCategory. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (YPCategory)

+ (NSTimer *)yp_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds
                                       repeats:(BOOL)repeats
                                         block:(void (^)(NSTimer *timer))block;

+ (NSTimer *)yp_timerWithTimeInterval:(NSTimeInterval)seconds
                              repeats:(BOOL)repeats
                                block:(void (^)(NSTimer *timer))block;
@end
