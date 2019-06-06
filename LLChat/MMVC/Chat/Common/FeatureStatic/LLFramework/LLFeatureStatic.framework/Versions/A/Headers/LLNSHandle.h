//
//  LLNSHandle.h
//  test
//
//  Created by wangzhaomeng on 16/8/10.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLNSHandle : NSObject

/**
 审核状态
 */
+ (BOOL)APPIsInReview:(NSString *)time days:(NSInteger)days;

/**
 字符串是否为空
 */
+ (BOOL)isBlankString:(NSString *)str;

/**
 email是否有效
 */
+ (BOOL)isValidateEmail:(NSString *)email;

/**
 url是否合法
 */
+ (BOOL)checkUrl:(NSString *)candidate;

/**
 是否有网络
 */
+ (BOOL)isConnectedToNetwork;

/**
 拨打指定电话号码
 */
+ (void)settingTelePhone:(NSString *)phone;

/**
 是否为越狱设备
 */
+ (BOOL)isPrisonBreakEquipment;

/**
 判断手机号是否存在
 */
+ (BOOL)checkPhoneNum:(NSString *)phoneNum;

/**
 这个月有几天
 */
+ (NSInteger)ll_getTotaldaysFromDate:(NSDate *)date;

/**
 第一天是周几
 */
+ (NSInteger)ll_getFirstWeekdayFromDate:(NSDate *)date;

/**
 两点之间的距离
 */
CGFloat CGPointDistanceBetweenTwoPoints(CGPoint point1, CGPoint point2);

CGRect LLRectMiddleArea(void);
CGRect LLRectTopArea(void);
CGRect LLRectBottomArea(void);

@end
