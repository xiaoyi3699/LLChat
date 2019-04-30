//
//  LLChatMessageManager.m
//  LLChat
//
//  Created by WangZhaomeng on 2019/4/24.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//

#import "LLChatMessageManager.h"
#import "LLChatHelper.h"

@implementation LLChatMessageManager

#pragma mark - 创建消息模型
//创建系统消息
+ (LLChatMessageModel *)createSystemMessage:(LLChatUserModel *)userModel
                                    message:(NSString *)message
                                   isSender:(BOOL)isSender {
    
    LLChatMessageModel *msgModel = [[LLChatMessageModel alloc] init];
    msgModel.msgType = LLMessageTypeSystem;
    msgModel.message = message;
    [self setConfig:msgModel userModel:userModel isSender:isSender];
    
    return msgModel;
}

//创建文本消息
+ (LLChatMessageModel *)createTextMessage:(LLChatUserModel *)userModel
                                  message:(NSString *)message
                                 isSender:(BOOL)isSender {
    
    LLChatMessageModel *msgModel = [[LLChatMessageModel alloc] init];
    msgModel.msgType = LLMessageTypeText;
    msgModel.message = message;
    [self setConfig:msgModel userModel:userModel isSender:isSender];
    
    return msgModel;
}

//创建图片消息
+ (LLChatMessageModel *)createImageMessage:(LLChatUserModel *)userModel
                                 thumbnail:(NSString *)thumbnail
                                  original:(NSString *)original
                                  isSender:(BOOL)isSender {
    
    LLChatMessageModel *msgModel = [[LLChatMessageModel alloc] init];
    msgModel.msgType = LLMessageTypeImage;
    msgModel.message   = @"[图片]";
    msgModel.thumbnail = thumbnail;
    msgModel.original  = original;
    [self setConfig:msgModel userModel:userModel isSender:isSender];
    
    return msgModel;
}

#pragma mark - pravite
+ (void)setConfig:(LLChatMessageModel *)msgModel userModel:(LLChatUserModel *)userModel isSender:(BOOL)isSender {
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
    msgModel.isSender  = isSender;
    msgModel.sendType  = LLMessageSendTypeWaiting;
    msgModel.timestamp = [LLChatHelper nowTimestamp];
}

@end
