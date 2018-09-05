//
//  LLIMService.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLIMService.h"

@implementation LLIMService

+ (instancetype)shareInstance {
    static LLIMService *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LLIMService alloc] init];
    });
    return instance;
}

- (void)sendMessage:(LLIMMessage *)message {
    //模拟服务器请求
    CGFloat duration = arc4random()%20*0.1;
    CGFloat failed = arc4random()%5;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //发送结果回调
        if (failed == 0) {
            if ([self.delegate respondsToSelector:@selector(onSendMessageSuccess:)]) {
                [self.delegate onSendMessageSuccess:message];
            }
        }
        else {
            if ([self.delegate respondsToSelector:@selector(onSendMessageFailed:)]) {
                [self.delegate onSendMessageFailed:message];
            }
        }
        
        //模拟服务器发消息
        if ([self.delegate respondsToSelector:@selector(onReceiveMessage:)]) {
            
            //将发送方和接收方互换, 模拟真实数据
            LLBaseMessageModel *model = [LLIMServiceHelper createModelWithIMMessage:message];
            
            NSString *fromId = model.fromId;
            NSString *toId = model.toId;
            
            NSString *fromAvatar = model.fromAvatar;
            NSString *toAvatar = model.toAvatar;
            
            NSString *fromNick = model.fromNick;
            NSString *toNick = model.toNick;
            
            model.fromId = toId;
            model.toId = fromId;
            
            model.fromAvatar = toAvatar;
            model.toAvatar = fromAvatar;
            
            model.fromNick = toNick;
            model.toNick = fromNick;
            
            LLIMMessage *sendMessage = [LLIMServiceHelper createIMMessageWithModel:model];
            
            //将受到的消息发回去
            [self.delegate onReceiveMessage:sendMessage];
        }
    });
}

@end
