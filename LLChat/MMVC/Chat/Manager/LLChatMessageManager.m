//
//  LLChatMessageManager.m
//  LLChat
//
//  Created by WangZhaomeng on 2019/4/24.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//

#import "LLChatMessageManager.h"

@implementation LLChatMessageManager

#pragma mark - 创建消息模型
//创建文本消息
+ (LLTextMessageModel *)createTextMessage:(LLChatUserModel *)userModel
                                  message:(NSString *)message
                                 isSender:(BOOL)isSender
                                  isGroup:(BOOL)isGroup {
    
    LLTextMessageModel *msgModel = [[LLTextMessageModel alloc] init];
    msgModel.message = message;
    [self setConfig:msgModel userModel:userModel isSender:isSender isGroup:isGroup];
    
    return msgModel;
}

//创建图片消息
+ (LLImageMessageModel *)createImageMessage:(LLChatUserModel *)userModel
                                  thumbnail:(NSString *)thumbnail
                                   original:(NSString *)original
                                   isSender:(BOOL)isSender
                                    isGroup:(BOOL)isGroup {
    
    LLImageMessageModel *msgModel = [[LLImageMessageModel alloc] init];
    msgModel.message   = @"[图片]";
    msgModel.thumbnail = thumbnail;
    msgModel.original  = original;
    [self setConfig:msgModel userModel:userModel isSender:isSender isGroup:isGroup];
    
    return msgModel;
}

#pragma mark - pravite
+ (void)setConfig:(LLBaseMessageModel *)msgModel userModel:(LLChatUserModel *)userModel isSender:(BOOL)isSender isGroup:(BOOL)isGroup {
    if (isSender) {
        msgModel.uid    = [LLChatUserModel shareInfo].uid;
        msgModel.name   = [LLChatUserModel shareInfo].name;
        msgModel.avatar = [LLChatUserModel shareInfo].avatar;
    }
    else {
        msgModel.uid    = userModel.uid;
        msgModel.name   = userModel.name;
        msgModel.avatar = userModel.avatar;
    }
    msgModel.isGroup   = isGroup;
    msgModel.isSender  = isSender;
    msgModel.sendType  = LLMessageSendTypeWaiting;
    msgModel.timestamp = [LLChatHelper nowTimestamp];
}

@end
