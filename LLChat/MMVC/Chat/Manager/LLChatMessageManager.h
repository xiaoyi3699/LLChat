//
//  LLChatMessageManager.h
//  LLChat
//
//  Created by WangZhaomeng on 2019/4/24.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLChatMessageManager : NSObject

#pragma mark - 创建消息模型
///创建文本消息
+ (LLTextMessageModel *)createTextMessage:(LLChatUserModel *)userModel
                                  message:(NSString *)message
                                 isSender:(BOOL)isSender
                                  isGroup:(BOOL)isGroup;

///创建图片消息
+ (LLImageMessageModel *)createImageMessage:(LLChatUserModel *)userModel
                                  thumbnail:(NSString *)thumbnail
                                   original:(NSString *)original
                                   isSender:(BOOL)isSender
                                    isGroup:(BOOL)isGroup;

@end
