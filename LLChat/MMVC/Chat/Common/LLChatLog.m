//
//  MyLog.m
//  LLFeature
//
//  Created by WangZhaomeng on 2017/9/27.
//  Copyright © 2017年 WangZhaomeng. All rights reserved.
//

#import "LLChatLog.h"

#define LL_LOG(format, ...) printf("[LLFeatureLog]: %s\n\n", [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String])
@interface LLChatLog ()

@property (nonatomic, assign) BOOL enable;

@end

@implementation LLChatLog

+ (instancetype)log {
    static LLChatLog *log;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        log = [[LLChatLog alloc] init];
    });
    return log;
}

void ll_openLogEnable(BOOL enable) {
    LLChatLog *log = [LLChatLog log];
    log.enable = enable;
}

void ll_log(NSString *format, ...) {
    if ([LLChatLog log].enable) {
        va_list args;
        va_start(args, format);
        NSString *str = [[NSString alloc] initWithFormat:format arguments:args];
        LL_LOG(@"%@",str);
        va_end(args);
    }
}

@end
