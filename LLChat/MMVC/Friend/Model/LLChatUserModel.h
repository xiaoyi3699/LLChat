//
//  LLChatUserModel.h
//  LLChat
//
//  Created by WangZhaomeng on 2019/4/24.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLChatUserModel : NSObject

#pragma mark - 用户基本信息
///id
@property (nonatomic, strong) NSString *uid;
///昵称
@property (nonatomic, strong) NSString *name;
///头像
@property (nonatomic, strong) NSString *avatar;

#pragma mark - 额外信息
///是否是群聊
@property (nonatomic, assign) BOOL isGroup;
///是否和该好友聊过
@property (nonatomic, assign) BOOL isChatted;
///是否开启消息免打扰
@property (nonatomic, assign) BOOL isIgnore;
///最后一条消息
@property (nonatomic, strong) NSString *lastMsg;
///最后一条消息时间
@property (nonatomic, assign) NSInteger lastTimestamp;

///默认登录用户
+ (instancetype)shareInfo;

@end
