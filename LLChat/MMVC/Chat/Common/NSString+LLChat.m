//
//  NSString+LLChat.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "NSString+LLChat.h"

@implementation NSString (LLChat)

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

@end
