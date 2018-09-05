//
//  LLIMServiceHelper.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLIMServiceHelper.h"

@implementation LLIMServiceHelper

+ (LLIMMessage *)createIMMessageWithModel:(LLBaseMessageModel *)model {
    LLIMMessage *message = [[LLIMMessage alloc] init];
    message.fromId = model.fromId;
    message.toId = model.toId;
    message.timestamp = model.timestamp;
    NSDictionary *dic = [model transfromDictionary];
    message.content = [NSString ll_getJsonByObj:dic];
    return message;
}

+ (LLBaseMessageModel *)createModelWithIMMessage:(LLIMMessage *)message {
    NSData *jsonData = [message.content dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableLeaves
                                                          error:nil];
    return [self createModelWithDic:dic];
}

+ (LLBaseMessageModel *)createModelWithDic:(NSDictionary *)dic {
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

+ (LLTextMessageModel *)createTextModelWithText:(NSString *)text {
    LLTextMessageModel *model = [[LLTextMessageModel alloc] init];
    model.fromId = @"1";
    model.toId = @"2";
    model.fromNick = @"小弈";
    model.toNick = @"大弈";
    model.fromAvatar = @"";
    model.toAvatar = @"";
    model.text = text;
    model.timestamp = [[NSDate date] timeIntervalSince1970];
    model.isSender = YES;
    model.isGroup = NO;
    model.sendType = LLMessageSendTypeWaiting;
    
    return model;
}

+ (LLImageMessageModel *)createImageModelWithText:(NSString *)text {
    LLImageMessageModel *model = [[LLImageMessageModel alloc] init];
    model.fromId = @"1";
    model.toId = @"2";
    model.fromNick = @"小弈";
    model.toNick = @"大弈";
    model.fromAvatar = @"";
    model.toAvatar = @"";
    model.text = text;
    model.timestamp = [[NSDate date] timeIntervalSince1970];
    model.isSender = YES;
    model.isGroup = NO;
    model.sendType = LLMessageSendTypeWaiting;
    model.imgW = 20+arc4random()%200;
    model.imgH = 20+arc4random()%200;
    
    return model;
}

@end
