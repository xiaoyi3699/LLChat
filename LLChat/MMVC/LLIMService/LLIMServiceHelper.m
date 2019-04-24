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
    LLMessageType type = (LLMessageType)[[dic objectForKey:@"msgType"] integerValue];
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

#pragma mark - 模拟发送与接收的消息模型
+ (LLTextMessageModel *)createSendTextModelWithText:(NSString *)text {
    LLTextMessageModel *model = [[LLTextMessageModel alloc] init];
    model.fromId = @"1";
    model.toId = @"2";
    model.fromNick = @"小弈";
    model.toNick = @"大弈";
    model.fromAvatar = @"";
    model.toAvatar = @"";
    model.message = text;
    model.timestamp = [LLChatHelper nowTimestamp];
    model.isSender = YES;
    model.isGroup = NO;
    model.sendType = LLMessageSendTypeWaiting;
    
    return model;
}

+ (LLImageMessageModel *)createSendImageModel {
    LLImageMessageModel *model = [[LLImageMessageModel alloc] init];
    model.fromId = @"1";
    model.toId = @"2";
    model.fromNick = @"小弈";
    model.toNick = @"大弈";
    model.fromAvatar = @"";
    model.toAvatar = @"";
    model.message = @"[图片]";
    model.timestamp = [LLChatHelper nowTimestamp];
    model.isSender = YES;
    model.isGroup = NO;
    model.sendType = LLMessageSendTypeWaiting;
    
    return model;
}

+ (LLTextMessageModel *)createReceiveTextModelWithText:(NSString *)text {
    LLTextMessageModel *model = [[LLTextMessageModel alloc] init];
    model.fromId = @"2";
    model.toId = @"1";
    model.fromNick = @"大弈";
    model.toNick = @"小弈";
    model.fromAvatar = @"";
    model.toAvatar = @"";
    model.message = text;
    model.timestamp = [LLChatHelper nowTimestamp];
    model.isSender = NO;
    model.isGroup = NO;
    model.sendType = LLMessageSendTypeWaiting;
    
    return model;
}

+ (LLImageMessageModel *)createReceiveImageModel {
    LLImageMessageModel *model = [[LLImageMessageModel alloc] init];
    model.fromId = @"2";
    model.toId = @"1";
    model.fromNick = @"大弈";
    model.toNick = @"小弈";
    model.fromAvatar = @"";
    model.toAvatar = @"";
    model.message = @"[图片]";
    model.timestamp = [LLChatHelper nowTimestamp];
    model.isSender = NO;
    model.isGroup = NO;
    model.sendType = LLMessageSendTypeWaiting;
    
    //原图和缩略图链接
    model.original = @"http://www.vasueyun.cn/llgit/llchat/2.jpg";
    model.thumbnail = @"http://www.vasueyun.cn/llgit/llchat/2_t.jpg";
    
    //图片尺寸
    UIImage *image = [UIImage imageNamed:@"2.jpg"];
    model.imgW = image.size.width;
    model.imgH = image.size.height;
    
    return model;
}

@end
