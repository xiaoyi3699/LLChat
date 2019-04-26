//
//  LLBaseMessageModel.h
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/3.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLChatBaseModel.h"

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

@interface LLBaseMessageModel : LLChatBaseModel

#pragma mark - 消息基本信息
///发送人id
@property (nonatomic, strong) NSString *uid;
///发送人昵称
@property (nonatomic, strong) NSString *name;
///发送人头像
@property (nonatomic, strong) NSString *avatar;
///文本内容
@property (nonatomic, strong) NSString *message;
///消息唯一识别标识
@property (nonatomic, strong) NSString *messageId;
///消息组id
@property (nonatomic, strong) NSString *gid;
///是否是群聊
@property (nonatomic, assign) BOOL isGroup;
///是否是自己发送
@property (nonatomic, assign) BOOL isSender;
///消息发送时间戳
@property (nonatomic, assign) NSInteger timestamp;
///消息类型
@property (nonatomic, assign) LLMessageType msgType;
///消息发送结果
@property (nonatomic, assign) LLMessageSendType sendType;
///缓存model宽, 优化列表滑动
@property (nonatomic, assign) NSInteger modelW;
///缓存model高, 优化列表滑动
@property (nonatomic, assign) NSInteger modelH;

#pragma mark - 图片消息
//图片宽高
@property (nonatomic, assign) NSInteger imgW;
@property (nonatomic, assign) NSInteger imgH;
//原图和缩略图
@property (nonatomic, strong) NSString *original;
@property (nonatomic, strong) NSString *thumbnail;

#pragma mark - 声音消息
//声音地址
@property (nonatomic, strong) NSString *voiceUrl;
//声音时长
@property (nonatomic, assign) NSInteger duration;

#pragma mark - 视频消息
//视频地址
@property (nonatomic, strong) NSString *videoUrl;
//视频封面地址
@property (nonatomic, strong) NSString *coverUrl;

#pragma mark -
///缓存model的高度
- (void)cacheModelSize;

@end
