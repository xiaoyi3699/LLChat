//
//  LLChatSessionModel.h
//  LLChat
//
//  Created by WangZhaomeng on 2019/4/29.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//  聊天会话

#import "LLChatBaseModel.h"

@interface LLChatSessionModel : LLChatBaseModel

///会话id<若会话为群聊,则sid为群聊gid, 若会话为私聊,则sid为对方uid>
@property (nonatomic, strong) NSString *sid;
///昵称
@property (nonatomic, strong) NSString *name;
///头像
@property (nonatomic, strong) NSString *avatar;
///未读消息数
@property (nonatomic, strong) NSString *unreadNum;
///是否是群聊
@property (nonatomic, assign) BOOL isGroup;
///是否开启消息免打扰
@property (nonatomic, assign) BOOL isIgnore;
///最后一条消息
@property (nonatomic, strong) NSString *lastMsg;
///最后一条消息时间
@property (nonatomic, assign) NSInteger lastTimestamp;

///时间戳排序
- (NSComparisonResult)compareOtherModel:(LLChatSessionModel *)model;

@end
