//
//  LLChatHelper.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLChatHelper.h"

@implementation LLChatHelper {
    UIImage *_senderBubbleImage;
    UIImage *_receiverBubbleImage;
}

+ (instancetype)shareInstance {
    static LLChatHelper *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LLChatHelper alloc] init];
    });
    return instance;
}

//聊天气泡
- (UIImage *)senderBubbleImage {
    if (_senderBubbleImage == nil) {
        UIImage *image = [UIImage imageNamed:@"ll_chat_bj2"];
        CGSize size = image.size;
        _senderBubbleImage = [image stretchableImageWithLeftCapWidth:size.width/2 topCapHeight:size.height*0.8];
    }
    return _senderBubbleImage;
}

- (UIImage *)receiverBubbleImage {
    if (_receiverBubbleImage == nil) {
        UIImage *image = [UIImage imageNamed:@"ll_chat_bj1"];
        CGSize size = image.size;
        _receiverBubbleImage = [image stretchableImageWithLeftCapWidth:size.width/2 topCapHeight:size.height*0.8];
    }
    return _receiverBubbleImage;
}

//当前时间戳
+ (NSTimeInterval)nowTimestamp {
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval time = [date timeIntervalSince1970]*1000;
    return time;
}

//获取指定日期
+ (NSDate *)dateFromTimeStamp:(NSString *)timeStamp {
    NSInteger scale = 1;
    if (timeStamp.floatValue > 999999999999) {
        scale = 1000;
    }
    NSTimeInterval time = [timeStamp integerValue]/scale;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    return date;
}

//获取指定时间戳
+ (NSTimeInterval)timestampFromDate:(NSDate *)date {
    NSTimeInterval time = [date timeIntervalSince1970]*1000;
    return time;
}

//时间格式化
+ (NSString *)timeFromTimeStamp:(NSString *)timeStamp {
    NSDate *date = [self dateFromTimeStamp:timeStamp];
    return [self timeFromDate:date];
}

+ (NSString *)timeFromDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear;
    // 1.获得当前时间的年月日
    NSDate *nowDate = [NSDate date];
    NSDateComponents *nowCmps = [calendar components:unit fromDate:nowDate];
    // 2.获得指定日期的年月日
    NSDateComponents *sinceCmps = [calendar components:unit fromDate:date];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter ll_dateFormatter:@"HH:mm"];
    NSString *time = [dateFormatter stringFromDate:date];
    if ((sinceCmps.year == nowCmps.year) &&
        (sinceCmps.month == nowCmps.month)) {
        
        if ((sinceCmps.day == nowCmps.day)) {
            //今天
            return [NSString stringWithFormat:@"今天 %@",time];
        }
        if (nowCmps.day - sinceCmps.day == 1) {
            //昨天
            return [NSString stringWithFormat:@"昨天 %@",time];
        }
    }
    return [NSString stringWithFormat:@"%@/%@/%@ %@",@(sinceCmps.year),@(sinceCmps.month),@(sinceCmps.day),time];
}

@end
