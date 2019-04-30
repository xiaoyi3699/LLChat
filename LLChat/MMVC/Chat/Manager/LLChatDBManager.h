//
//  LLChatDBManager.h
//  LLChat
//
//  Created by WangZhaomeng on 2019/4/29.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//  数据库操纵

#import <Foundation/Foundation.h>
#import "LLChatModel.h"

@interface LLChatDBManager : NSObject

+ (instancetype)DBManager;

#pragma mark - user表操纵
///添加用户
- (void)insertUserModel:(LLChatUserModel *)model;
///更新用户
- (void)updateUserModel:(LLChatUserModel *)model;
///查询用户
- (LLChatUserModel *)selectUserModel:(NSString *)uid;
///删除用户
- (void)deleteUserModel:(NSString *)uid;

#pragma mark - group表操纵
///添加群
- (void)insertGroupModel:(LLChatGroupModel *)model;
///更新群
- (void)updateGroupModel:(LLChatGroupModel *)model;
///查询群
- (LLChatGroupModel *)selectGroupModel:(NSString *)gid;
///删除群
- (void)deleteGroupModel:(NSString *)gid;

#pragma mark - session表操纵
///添加会话
- (void)insertSessionModel:(LLChatSessionModel *)model;
///更新会话
- (void)updateSessionModel:(LLChatSessionModel *)model;
///查询私聊会话
- (LLChatSessionModel *)selectSessionModelWithUser:(LLChatUserModel *)userModel;
///查询群聊会话
- (LLChatSessionModel *)selectSessionModelWithGroup:(LLChatGroupModel *)groupModel;
///删除会话
- (void)deleteSessionModel:(NSString *)sid;
///查询会话对应的用户或者群聊
- (LLChatBaseModel *)selectChatModel:(LLChatSessionModel *)model;
///查询会话对应的用户
- (LLChatUserModel *)selectChatUserModel:(LLChatSessionModel *)model;
///查询会话对应的群聊
- (LLChatGroupModel *)selectChatGroupModel:(LLChatSessionModel *)model;

#pragma mark - message表操纵
//私聊消息列表
- (NSMutableArray *)messagesWithUser:(LLChatUserModel *)model;
//群聊消息列表
- (NSMutableArray *)messagesWithGroup:(LLChatUserModel *)model;
///插入私聊消息
- (void)insertMessage:(LLChatMessageModel *)message chatWithUser:(LLChatUserModel *)model;
///插入群聊消息
- (void)insertMessage:(LLChatMessageModel *)message chatWithGroup:(LLChatGroupModel *)model;

@end
