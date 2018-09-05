//
//  LLIMServiceObserver.h
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/5.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLIMServiceObserver : NSObject

//im登录状态
@property (nonatomic, assign) LLIMConectState state;

//未读消息条数
@property (nonatomic, assign) NSInteger msgBadgeValue;

//还未发送成功的消息
@property (nonatomic, strong) NSMutableArray *unSendMessages;

//LLFriendViewController 好友界面
@property (nonatomic, weak) id<LLIMServiceDelegate> delegate1;

//LLMessageViewController 消息列表界面
@property (nonatomic, weak) id<LLIMServiceDelegate> delegate2;

//LLChatViewController 聊天界面
@property (nonatomic, weak) id<LLIMServiceDelegate> delegate3;

+ (instancetype)shareInstance;

@end
