//
//  LLIMServiceObserver.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/5.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLIMServiceObserver.h"

@interface LLIMServiceObserver ()<LLIMServiceDelegate>

@end

@implementation LLIMServiceObserver

+ (instancetype)shareInstance {
    static LLIMServiceObserver *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LLIMServiceObserver alloc] init];
        instance.msgBadgeValue  = 0;
        instance.state = LLIMConectStateUnconnect;
        instance.unSendMessages = [[NSMutableArray alloc] init];
        
        [LLIMService shareInstance].delegate = instance;
    });
    return instance;
}

//开启IM服务
- (void)IMChatLogin {
    if (self.state == LLIMConectStateUnconnect || self.state == LLIMConectStateConnectFail) {
        [[LLIMService shareInstance] loginIM];
    }
}

//好友、消息、聊天 三个界面均需要监听IM相关信息, 故使用三个代理属性传值, 可根据需要进行删减
//若监听页面太多, 可使用通知处理, 建议使用代理, 效率较高
- (void)onSendMessageSuccess:(LLIMMessage *)message {
    [self ll_onSendMessageSuccess:message];
    if ([self.delegate1 respondsToSelector:@selector(onSendMessageSuccess:)]) {
        [self.delegate1 onSendMessageSuccess:message];
    }
    if ([self.delegate2 respondsToSelector:@selector(onSendMessageSuccess:)]) {
        [self.delegate2 onSendMessageSuccess:message];
    }
    if ([self.delegate3 respondsToSelector:@selector(onSendMessageSuccess:)]) {
        [self.delegate3 onSendMessageSuccess:message];
    }
}

- (void)onSendMessageFailed:(LLIMMessage *)message {
    [self ll_onSendMessageFailed:message];
    if ([self.delegate1 respondsToSelector:@selector(onSendMessageFailed:)]) {
        [self.delegate1 onSendMessageFailed:message];
    }
    if ([self.delegate2 respondsToSelector:@selector(onSendMessageFailed:)]) {
        [self.delegate2 onSendMessageFailed:message];
    }
    if ([self.delegate3 respondsToSelector:@selector(onSendMessageFailed:)]) {
        [self.delegate3 onSendMessageFailed:message];
    }
}

- (void)onReceiveMessage:(LLIMMessage *)message {
    [self ll_onReceiveMessage:message];
    if ([self.delegate1 respondsToSelector:@selector(onReceiveMessage:)]) {
        [self.delegate1 onReceiveMessage:message];
    }
    if ([self.delegate2 respondsToSelector:@selector(onReceiveMessage:)]) {
        [self.delegate2 onReceiveMessage:message];
    }
    if ([self.delegate3 respondsToSelector:@selector(onReceiveMessage:)]) {
        [self.delegate3 onReceiveMessage:message];
    }
}

- (void)onConnect:(LLIMConectState)state {
    [self ll_onConnect:state];
    if ([self.delegate1 respondsToSelector:@selector(onConnect:)]) {
        [self.delegate1 onConnect:state];
    }
    if ([self.delegate2 respondsToSelector:@selector(onConnect:)]) {
        [self.delegate2 onConnect:state];
    }
    if ([self.delegate3 respondsToSelector:@selector(onConnect:)]) {
        [self.delegate3 onConnect:state];
    }
}

//消息回调的统一处理
- (void)ll_onSendMessageSuccess:(LLIMMessage *)message {
    LLBaseMessageModel *model = [self unSendModelFromMessage:message];
    if (model) {
        model.sendType = LLMessageSendTypeSuccess;
        [self.unSendMessages removeObject:model];
    }
}

- (void)ll_onSendMessageFailed:(LLIMMessage *)message {
    LLBaseMessageModel *model = [self unSendModelFromMessage:message];
    if (model) {
        model.sendType = LLMessageSendTypeFailed;
        //这里可以做消息重发处理
    }
}

- (void)ll_onReceiveMessage:(LLIMMessage *)message {
    
}

- (void)ll_onConnect:(LLIMConectState)state {
    self.state = state;
}

//根据message从消息发送队列中找到对应的model, 改变其状态, 用来刷新UI
- (LLBaseMessageModel *)unSendModelFromMessage:(LLIMMessage *)message {
    for (LLBaseMessageModel *model in self.unSendMessages) {
        if (model.timestamp == message.timestamp) {
            return model;
        }
    }
    return nil;
}

@end
