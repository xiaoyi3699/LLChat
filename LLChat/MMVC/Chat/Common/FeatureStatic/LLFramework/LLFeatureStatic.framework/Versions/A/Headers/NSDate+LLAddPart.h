//
//  NSDate+LLAddPart.h
//  test
//
//  Created by wangzhaomeng on 16/8/16.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LLAddPart)

/**
 获取当前时区与系统时区的差值
 */
+ (NSTimeInterval)ll_DTimeValue;

/**
 时间戳转换为日期
 */
+ (NSDate *)ll_dateFromTimeStamp:(NSString *)timeStamp;

/**
 根据timeString串获取date(timeString格式:@"2016-08-01 15:28:30")
 */
+ (NSDate *)ll_dateFromTimeString:(NSString *)timeString;

/**
 判断两个日期是否在同一周
 */
- (BOOL)ll_isSameDateWithDate:(NSDate *)date;

/**
 判断是不是今天
 */
- (BOOL)ll_isToday;

@end
