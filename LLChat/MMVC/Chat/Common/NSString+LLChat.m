//
//  NSString+LLChat.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "NSString+LLChat.h"

@implementation NSString (LLChat)

- (id)ll_transformToObj{
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
}

+ (NSString *)ll_getJsonByObj:(id)obj {
    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:obj options:kNilOptions error:&error];
    NSString *json = @"";
    if (data) {
        json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        json = [json stringByReplacingOccurrencesOfString:@" " withString:@""];
        json = [json stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    }
    return json;
}

/**
 URLEnCode编码
 */
- (NSString *)ll_URLEncodedString {
    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

/**
 URLEnCode解码
 */
- (NSString *)ll_URLDecodedString {
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
