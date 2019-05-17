//
//  LLChat.h
//  LLChat
//
//  Created by WangZhaomeng on 2019/4/26.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//

#ifndef LLChat_h
#define LLChat_h

#import "LLChatHelper.h"
#import "LLChatImageCache.h"
#import "LLChatSqliteManager.h"

#import "LLChatUserModel.h"
#import "LLChatGroupModel.h"
#import "LLChatSessionModel.h"
#import "LLChatMessageModel.h"

#import "LLChatDBManager.h"
#import "LLEmoticonManager.h"
#import "LLChatMessageManager.h"
#import "LLChatNotificationManager.h"

#import "LLChatViewController.h"

#define LLCHAT_SCREEN_WIDTH   [[LLChatHelper shareInstance] screenW]
#define LLCHAT_SCREEN_HEIGHT  [[LLChatHelper shareInstance] screenH]

#define LLCHAT_IPHONEX    [[LLChatHelper shareInstance] iPhoneX]
#define LLCHAT_NAV_TOP_H  [[LLChatHelper shareInstance] navBarH]
#define LLCHAT_BAR_BOT_H  [[LLChatHelper shareInstance] tabBarH]
#define LLCHAT_BOTTOM_H   [[LLChatHelper shareInstance] iPhoneXBottomH]

//输入框的高度
#define LLCHAT_INPUT_H    [[LLChatHelper shareInstance] inputH]
//自定义键盘的高度(不包含输入框)
#define LLCHAT_KEYBOARD_H [[LLChatHelper shareInstance] keyboardH]

//默认图
#define LLCHAT_BAD_IMAGE [UIImage imageNamed:@"ll_chat_default"]

#endif /* LLChat_h */
