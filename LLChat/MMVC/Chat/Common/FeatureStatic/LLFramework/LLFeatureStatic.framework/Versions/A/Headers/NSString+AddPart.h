//
//  NSString+AddPart.h
//  test
//
//  Created by wangzhaomeng on 16/7/26.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (AddPart)

#pragma mark - 进制转换
/**
 10进制转换成16进制
 */
+ (NSString *)ll_getHexByDecimal:(NSString *)decimal;

/**
 16进制转换成10进制
 */
+ (NSString *)ll_getDecimalByHex:(NSString *)hex;

/**
 10进制转换成2进制
 */
+ (NSString *)ll_getBinaryByDecimal:(NSInteger)decimal;

/**
 2进制转换成10进制
 */
+ (NSInteger)ll_getDecimalByBinary:(NSString *)binary;

/**
 2进制转换成16进制
 */
+ (NSString *)ll_getHexByBinary:(NSString *)binary;

/**
 16进制转换成2制
 */
+ (NSString *)ll_getBinaryByHex:(NSString *)hex;

///NSData转16进制
+ (NSString *)ll_getHexByData:(NSData *)data;

#pragma mark - 编码、解码、类型转换
/**
 URLEnCode编码
 */
- (NSString *)ll_URLEncodedStringUnique;

/**
 URLEnCode编码
 */
- (NSString *)ll_URLEncodedString;

/**
 URLEnCode解码
 */
- (NSString *)ll_URLDecodedString;

/**
 unicode编码
 */
- (NSString *)ll_uniEncode;

/**
 unicode解码
 */
- (NSString *)ll_uniDecode;

/**
 MD5编码
 */
- (NSString *)ll_MD5String;

#pragma mark - 时间、日期
/**
 计算星座
 */
+ (NSString *)ll_astroWithBirthday:(NSDate *)birthday;

/**
 计算年龄
 */
+ (NSString *)ll_ageWithBirthday:(NSDate *)birthday;

/**
 日期转换为时间戳
 */
+ (NSString *)ll_timeStampFromDate:(NSDate *)date;

/**
 根据date获取timeString
 */
+ (NSString *)ll_timeStringFromDate:(NSDate *)date;

/**
 获取当前时区与系统时区的差值
 */
+ (NSInteger)ll_DTimeValue;

/**
 获取时间差
 */
+ (NSString *)ll_timeWithDate:(NSDate *)date;

#pragma mark - 系统
/**
 获取mac地址
 */
+ (NSString *)ll_macAddress;

/**
 获取手机IP,如:192.168.1.133,需连网
 */
+ (NSString *)ll_IPAddress;

/**
 获取当前连接的WIFI名称
 */
+ (NSString *)ll_wifiSSID;

/**
 获取当前网络状态
 */
+ (NSString *)ll_netStatus;

#pragma mark - 类方法
///字典、数组转json
+ (NSString *)ll_getJsonByObj:(id)obj;

/**
 color转16进制字符串
 */
+ (NSString *)ll_hexFromUIColor:(UIColor *)color;

/**
 图片转换为base64编码
 */
+ (NSString *)ll_base64StrFromImage:(UIImage *)image;

/**
 多个字符串拼接
 */
+ (NSString *)ll_stringWithFormat:(NSString *)value,...;

/**
 获取32位随机字符串
 */
+ (NSString *)ll_32bitString;

/**
 获取随机不重复字符串(重复几率很小)
 */
+ (NSString *)ll_uniqueString;

/**
 手机机型
 */
+ (NSString *)ll_deviceString;

/**
 阿拉伯数字转中文格式
 */
+ (NSString *)ll_chineseFromArebic:(NSString *)arebic;

/**
 将秒数换算成具体时长
 */
+ (NSString *)ll_timeWithSecond:(NSInteger)second;

/**
 获取实际使用的LaunchImage图片
 */
+ (NSString *)ll_launchImageName;

#pragma mark - 实例方法
/**
 获取文本高度
 */
- (CGFloat)ll_heightWithWidth:(CGFloat)width font:(UIFont *)font;

/**
 根据多个字符串截取
 */
- (NSArray *)ll_componentsSeparatedByStringSet:(NSString *)stringSet;

/**
 截取两个字符之间的字符
  */
- (NSString *)ll_substringBetweenStr1:(NSString *)str1 str2:(NSString *)str2;

/**
 是否含有汉字
 */
- (BOOL)ll_checkIsContainChinese;

/**
 asc码提取字符串
 */
- (NSArray *)ll_specifiedWithStartASC:(int)start endASC:(int)end unnecessaries:(NSArray **)unnecessaries;

/**
 删除字符串头尾空格
 */
- (NSString *)ll_deleteHeadAndTailWhitespace;

/*
 json字符串转字典/数组
 */
- (id)ll_transformToObj;

/**
 汉字转拼音
 */
- (NSString *)ll_tranformToPinyin;

/**
 小写
 */
- (NSString *)ll_lowercaseString;

/**
 大写
 */
- (NSString *)ll_uppercaseString;

/**
 首字母大写
 */
- (NSString *)ll_firstCharactersUppercase;

/**
 data转换为字符串
 */
- (NSString *)ll_stringFromData:(NSData *)data;

/**
 读取剪切板字符
 */
- (NSString *)ll_pasteboardString;
- (void)ll_setPasteboardString:(NSString *)text;

///文稿
- (BOOL)ll_flieIsDraft;
///图片
- (BOOL)ll_flieIsImage;
///音频
- (BOOL)ll_flieIsAudio;
///视频
- (BOOL)ll_flieIsVideo;

/**
 按照字母排序
 */
- (NSComparisonResult)ll_compareOtherString:(NSString *)otherString;

///过滤特殊字符
- (NSString *)ll_deleteSpecialCharacter;

@end

@interface NSMutableString (AddPart)


@end
