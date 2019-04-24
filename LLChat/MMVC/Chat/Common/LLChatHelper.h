//
//  LLChatHelper.h
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLChatHelper : NSObject

+ (instancetype)shareInstance;

//聊天气泡
- (UIImage *)senderBubbleImage;
- (UIImage *)receiverBubbleImage;

//当前时间戳
+ (NSTimeInterval)nowTimestamp;

//获取指定日期
+ (NSDate *)dateFromTimeStamp:(NSString *)timeStamp;

//获取指定时间戳
+ (NSTimeInterval)timestampFromDate:(NSDate *)date;

//时间格式化
+ (NSString *)timeFromTimeStamp:(NSString *)timeStamp;
+ (NSString *)timeFromDate:(NSDate *)date;

@end
