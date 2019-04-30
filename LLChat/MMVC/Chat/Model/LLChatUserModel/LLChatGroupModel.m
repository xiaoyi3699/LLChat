//
//  LLChatGroupModel.m
//  LLChat
//
//  Created by WangZhaomeng on 2019/4/29.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//

#import "LLChatGroupModel.h"

@implementation LLChatGroupModel

///将字典转化为model
+ (instancetype)modelWithDic:(NSDictionary *)dic {
    LLChatGroupModel *model = [[LLChatGroupModel alloc] init];
    for (NSString *key in dic.allKeys) {
        [model setValue:[dic objectForKey:key] forKey:key];
    }
    return model;
}

@end
