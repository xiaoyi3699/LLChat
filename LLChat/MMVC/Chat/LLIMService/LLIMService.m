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

- (void)loginIM {
    //模拟服务器登录IM
    if ([self.delegate respondsToSelector:@selector(onConnect:)]) {
        [self.delegate onConnect:LLIMConectStateConnecting];
    }
    
    CGFloat duration = arc4random()%20*0.1+0.5;
    CGFloat failed = arc4random()%5;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if ([self.delegate respondsToSelector:@selector(onConnect:)]) {
            if (failed == 0) {
                [self.delegate onConnect:LLIMConectStateConnectFail];
            }
            else {
                [self.delegate onConnect:LLIMConectStateConnected];
            }
        }
    });
}

- (void)logoutIM {
    //模拟服务器退出IM
    if ([self.delegate respondsToSelector:@selector(onConnect:)]) {
        [self.delegate onConnect:LLIMConectStateUnconnect];
    }
}

- (void)sendMessage:(LLIMMessage *)message {
    //模拟服务器发送消息
    CGFloat duration = arc4random()%20*0.1;
    CGFloat failed = arc4random()%5;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //发送结果回调
        if (failed == 0) {
            //模拟发送失败
            if ([self.delegate respondsToSelector:@selector(onSendMessageFailed:)]) {
                [self.delegate onSendMessageFailed:message];
            }
            return;
        }
        else {
            //模拟发送成功
            if ([self.delegate respondsToSelector:@selector(onSendMessageSuccess:)]) {
                [self.delegate onSendMessageSuccess:message];
            }
        }
        
        //模拟服务器接收消息
        if ([self.delegate respondsToSelector:@selector(onReceiveMessage:)]) {
            
            NSDictionary *dic = [message.content ll_transformToObj];
            LLMessageType type = (LLMessageType)[[dic objectForKey:@"msgType"] integerValue];
            
            LLBaseMessageModel *model;
            if (type == LLMessageTypeText) {
                NSString *t = [NSString stringWithFormat:@"收到：%@",[dic objectForKey:@"message"]];
                model = [LLIMServiceHelper createReceiveTextModelWithText:t];
            }
            else if (type == LLMessageTypeImage) {
                model = [LLIMServiceHelper createReceiveImageModel];
            }
            if (model) {
                //模拟收到消息
                LLIMMessage *sendMessage = [LLIMServiceHelper createIMMessageWithModel:model];
                [self.delegate onReceiveMessage:sendMessage];
            }
        }
    });
}

@end
