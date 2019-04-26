//
//  Header.h
//  LLChat
//
//  Created by WangZhaomeng on 2019/4/26.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import "LLChatHelper.h"

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

#endif /* Header_h */
