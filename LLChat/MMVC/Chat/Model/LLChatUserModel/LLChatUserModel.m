//
//  LLChatUserModel.m
//  LLChat
//
//  Created by WangZhaomeng on 2019/4/24.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//

#import "LLChatUserModel.h"

@implementation LLChatUserModel

///默认登录用户
+ (instancetype)shareInfo {
    static LLChatUserModel *userInfo;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userInfo = [[LLChatUserModel alloc] init];
        userInfo.uid = @"00001";
        userInfo.name = @"无敌是多么的寂寞";
        userInfo.avatar = @"http://www.vasueyun.cn/hzl/logo.png";
    });
    return userInfo;
}

///将字典转化为model
+ (instancetype)modelWithDic:(NSDictionary *)dic {
    LLChatUserModel *model = [[LLChatUserModel alloc] init];
    for (NSString *key in dic.allKeys) {
        [model setValue:[dic objectForKey:key] forKey:key];
    }
    return model;
}

@end
