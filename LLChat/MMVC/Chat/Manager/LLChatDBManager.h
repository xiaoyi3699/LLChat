//
//  LLChatDBManager.h
//  LLChat
//
//  Created by WangZhaomeng on 2019/4/29.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//  数据库操纵

#import <Foundation/Foundation.h>
@class LLChatUserModel;
@class LLChatGroupModel;
@class LLChatSessionModel;

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
///查询会话
- (LLChatSessionModel *)selectSessionModel:(NSString *)sid;
///删除会话
- (void)deleteSessionModel:(NSString *)sid;

@end
