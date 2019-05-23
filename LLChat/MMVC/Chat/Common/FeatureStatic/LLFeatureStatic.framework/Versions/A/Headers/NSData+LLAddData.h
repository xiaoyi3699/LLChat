//
//  NSData+LLAddData.h
//  LLFoundation
//
//  Created by wangzhaomeng on 16/9/8.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (LLAddData)

///16进制转NSData
- (NSData *)ll_getDataByHex:(NSString *)hex;

/**
 字典/数组转换为json
 */
+ (NSData *)ll_JSONData:(id)obj;

/**
 NSString转换成NSData对象
 */
+ (NSData *)ll_dataFromString:(NSString *)string;

/**
 16进制转换成NSData对象
 */
+ (NSData *)ll_dataWithHex:(NSString *)hex;

//获取图片扩展名
- (LLImageType)ll_contentType;

@end

@interface NSMutableData (LLAddPart)

@end
