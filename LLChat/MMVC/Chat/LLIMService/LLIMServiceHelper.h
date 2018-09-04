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
+ (LLIMMessage *)createMessageWithModel:(LLBaseMessageModel *)model;

//将LLIMMessage对象转化为LLBaseMessageModel对象
+ (LLBaseMessageModel *)createMessageModelWithMessage:(LLIMMessage *)message;

//将字典转化为LLBaseMessageModel对象
+ (LLBaseMessageModel *)createMessageModelWithDic:(NSDictionary *)dic;

@end
