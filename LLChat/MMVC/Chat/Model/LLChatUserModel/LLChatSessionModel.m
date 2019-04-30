//
//  LLChatSessionModel.m
//  LLChat
//
//  Created by WangZhaomeng on 2019/4/29.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//

#import "LLChatSessionModel.h"

@implementation LLChatSessionModel

///将字典转化为model
+ (instancetype)modelWithDic:(NSDictionary *)dic {
    LLChatSessionModel *model = [[LLChatSessionModel alloc] init];
    for (NSString *key in dic.allKeys) {
        [model setValue:[dic objectForKey:key] forKey:key];
    }
    return model;
}

@end
