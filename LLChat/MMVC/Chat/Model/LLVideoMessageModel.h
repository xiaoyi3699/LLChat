//
//  LLVideoMessageModel.h
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/3.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLBaseMessageModel.h"

@interface LLVideoMessageModel : LLBaseMessageModel

//视频封面地址(本地路径下封面不存在时, 可使用该地址加载封面, 并存储到本地)
@property (nonatomic, strong) NSString *coverUrl;

//视频封面本地路径(发送方发送的封面 或 接收方已经加载过封面后, 可使用本地路径)
@property (nonatomic, strong) NSString *coverPath;

//视频地址(本地路径下视频不存在时, 可使用该地址加载视频, 并存储到本地)
@property (nonatomic, strong) NSString *videoUrl;

//视频本地路径(发送方发送的视频 或 接收方已经加载过视频后, 可使用本地路径)
@property (nonatomic, strong) NSString *videoPath;

@end
