//
//  LLIMServiceHelper.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLIMServiceHelper.h"

@implementation LLIMServiceHelper

+ (LLIMMessage *)createMessageWithModel:(LLBaseMessageModel *)model {
    LLIMMessage *message = [[LLIMMessage alloc] init];
    message.fromId = model.fromId;
    message.toId = model.toId;
    message.timestamp = model.timestamp;
    NSDictionary *dic = [[LLSqliteManager defaultManager] DictionaryFromModel:model];
    message.content = [NSString ll_getJsonByObj:dic];
    return message;
}

+ (LLBaseMessageModel *)createMessageModelWithMessage:(LLIMMessage *)message {
    NSData *jsonData = [message.content dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableLeaves
                                                          error:nil];
    return [self createMessageModelWithDic:dic];
}

+ (LLBaseMessageModel *)createMessageModelWithDic:(NSDictionary *)dic {
    LLMessageType type = (LLMessageType)[[dic objectForKey:@"type"] integerValue];
    LLBaseMessageModel *model;
    if (type == LLMessageTypeText) {
        model = [[LLTextMessageModel alloc] init];
    }
    else if (type == LLMessageTypeImage) {
        model = [[LLImageMessageModel alloc] init];
    }
    else if (type == LLMessageTypeVoice) {
        model = [[LLVoiceMessageModel alloc] init];
    }
    else if (type == LLMessageTypeVideo) {
        model = [[LLVideoMessageModel alloc] init];
    }
    for (NSString *key in dic.allKeys) {
        [model setValue:[dic objectForKey:key] forKey:key];
    }
    return model;
}

@end
