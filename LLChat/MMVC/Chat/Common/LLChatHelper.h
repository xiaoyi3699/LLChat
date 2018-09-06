//
//  LLChatHelper.h
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLChatHelper : NSObject

+ (instancetype)shareInstance;

//聊天气泡
- (UIImage *)senderBubbleImage;
- (UIImage *)receiverBubbleImage;

//13位时间戳
+ (NSTimeInterval)nowTimestamp;

@end
