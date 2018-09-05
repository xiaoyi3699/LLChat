//
//  LLIMServiceHelper.h
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLIMServiceHelper : NSObject

//将LLBaseMessageModel对象转化为LLIMMessage对象
+ (LLIMMessage *)createIMMessageWithModel:(LLBaseMessageModel *)model;

//将LLIMMessage对象转化为LLBaseMessageModel对象
+ (LLBaseMessageModel *)createModelWithIMMessage:(LLIMMessage *)message;

//将字典转化为LLBaseMessageModel对象
+ (LLBaseMessageModel *)createModelWithDic:(NSDictionary *)dic;

//消息模型
+ (LLTextMessageModel *)createTextModelWithText:(NSString *)text;
+ (LLImageMessageModel *)createImageModelWithText:(NSString *)text;

@end
