//
//  NSDateFormatter+LLAddPart.m
//  test
//
//  Created by XHL on 16/8/16.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "NSDateFormatter+LLChat.h"

@implementation NSDateFormatter (LLChat)

+ (NSMutableDictionary *)formatterCache {
    static dispatch_once_t onceToken;
    static NSMutableDictionary *cache;
    dispatch_once(&onceToken, ^{
        cache = [NSMutableDictionary dictionaryWithCapacity:0];
    });
    return cache;
}

+ (NSDateFormatter *)ll_defaultDateFormatter {
    NSString *f = @"yyyy-MM-dd HH:mm:ss";
    return [self ll_dateFormatter:f];
}

+ (NSDateFormatter *)ll_detailDateFormatter {
    NSString *f = @"yyyy-MM-dd HH:mm:ss.SSS EEEE";
    return [self ll_dateFormatter:f];
}

+ (NSDateFormatter *)ll_dateFormatter:(NSString *)f {
    NSDateFormatter *formatter = [[self formatterCache] objectForKey:f];
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:f];
        [[self formatterCache] setObject:formatter forKey:f];
    }
    return formatter;
}

@end
