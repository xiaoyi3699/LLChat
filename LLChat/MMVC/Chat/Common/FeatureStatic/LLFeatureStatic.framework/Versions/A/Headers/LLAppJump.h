//
//  LLAppJump.h
//  LLFoundation
//
//  Created by wangzhaomeng on 16/8/18.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLAppJump : NSObject

+ (LLAppJump *)shareInstance;

///打开链接
+ (BOOL)openUrlStr:(NSString *)urlStr;

///打开APP设置界面
+ (void)openAPPSetting;

///打开QQ私聊界面
+ (BOOL)QQChatToUser:(NSString *)account;

///打开应用
+ (BOOL)openAppWithAppType:(LLAPPType)type;

///AppStore评论
+ (void)openAppStoreScore:(NSString *)appId type:(LLAppStoreType)type;

///AppStore下载
+ (void)openAppStoreDownload:(NSString *)appId type:(LLAppStoreType)type;

@end
