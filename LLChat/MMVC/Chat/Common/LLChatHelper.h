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

- (UIImage *)senderBubbleImage;
- (UIImage *)receiverBubbleImage;

@end
