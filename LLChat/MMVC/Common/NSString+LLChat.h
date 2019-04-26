//
//  NSString+LLChat.h
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LLChat)

- (id)ll_transformToObj;
+ (NSString *)ll_getJsonByObj:(id)obj;

/**
 URLEnCode编码
 */
- (NSString *)ll_URLEncodedString;

/**
 URLEnCode解码
 */
- (NSString *)ll_URLDecodedString;

@end
