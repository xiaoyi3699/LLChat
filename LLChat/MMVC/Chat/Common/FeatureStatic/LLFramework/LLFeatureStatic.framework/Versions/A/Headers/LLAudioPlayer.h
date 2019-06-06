//
//  LLAudioPlayer.h
//  LLFoundation
//
//  Created by wangzhaomeng on 16/8/25.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//  本地音频播放器

#import <AVFoundation/AVFoundation.h>

/*
 使用时，必须创建全局变量
 */
@interface LLAudioPlayer : AVAudioPlayer

- (id)initWithContentsOfURL:(NSURL *)url error:(NSError **)outError;
- (id)initWithData:(NSData *)data error:(NSError **)outError;
- (void)startPlay;
- (void)pausePlay;
- (void)stopPlay;

@end
