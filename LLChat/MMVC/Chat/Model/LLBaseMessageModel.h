//
//  LLBaseMessageModel.h
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/3.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger {
    LLMessageTypeSystem = 0, //系统消息
    LLMessageTypeText,       //文本消息
    LLMessageTypeImage,      //图片消息
    LLMessageTypeVoice,      //声音消息
    LLMessageTypeVideo,      //视频消息
}LLMessageType;

typedef enum : NSInteger {
    LLMessageSendTypeWaiting = 0,//正在发送
    LLMessageSendTypeSuccess,    //发送成功
    LLMessageSendTypeFailed,     //发送失败
}LLMessageSendType;

@interface LLBaseMessageModel : NSObject

@property (nonatomic, strong) NSString *fromId;
@property (nonatomic, strong) NSString *toId;

@property (nonatomic, strong) NSString *fromNick;
@property (nonatomic, strong) NSString *toNick;

@property (nonatomic, strong) NSString *fromAvatar;
@property (nonatomic, strong) NSString *toAvatar;

@property (nonatomic, strong) NSString *message;

@property (nonatomic, assign) BOOL isGroup;
@property (nonatomic, assign) BOOL isSender;
@property (nonatomic, assign) NSInteger timestamp;
@property (nonatomic, assign) LLMessageType msgType;
@property (nonatomic, assign) LLMessageSendType sendType;

@property (nonatomic, assign) NSInteger modelW;
@property (nonatomic, assign) NSInteger modelH;

/*
 缓存model的高度
 */
- (void)cacheModelSize;

/*
 对象转换为字典
 */
- (NSDictionary *)transfromDictionary;

@end
