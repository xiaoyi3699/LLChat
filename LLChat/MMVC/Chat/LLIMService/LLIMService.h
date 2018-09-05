//
//  LLIMService.h
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//  IM服务, 使用延时操作来模拟登录、退出、收发消息等功能

#import <Foundation/Foundation.h>
#import "LLIMMessage.h"
#import "LLIMServiceHelper.h"

@protocol LLIMServiceDelegate;

typedef enum : NSInteger {
    LLIMConectStateUnconnect = 0,
    LLIMConectStateConnecting,
    LLIMConectStateConnected,
    LLIMConectStateConnectFail,
}LLIMConectState;
@interface LLIMService : NSObject

@property (nonatomic, weak) id<LLIMServiceDelegate> delegate;

+ (instancetype)shareInstance;
///登录IM
- (void)loginIM;
///退出
- (void)logoutIM;
///发消息
- (void)sendMessage:(LLIMMessage *)message;

@end

@protocol LLIMServiceDelegate <NSObject>

@optional
- (void)onConnect:(LLIMConectState)state;
- (void)onSendMessageSuccess:(LLIMMessage *)message;
- (void)onSendMessageFailed:(LLIMMessage *)message;
- (void)onReceiveMessage:(LLIMMessage *)message;

@end
