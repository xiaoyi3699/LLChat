//
//  LLVoiceMessageModel.h
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/3.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLBaseMessageModel.h"

@interface LLVoiceMessageModel : LLBaseMessageModel

//声音地址(本地路径下声音不存在时, 可使用该地址加载声音, 并存储到本地)
@property (nonatomic, strong) NSString *voiceUrl;

//声音本地路径(发送方发送的声音 或 接收方已经加载过声音后, 可使用本地路径)
@property (nonatomic, strong) NSString *voicePath;

//声音时长
@property (nonatomic, assign) NSInteger duration;

@end
