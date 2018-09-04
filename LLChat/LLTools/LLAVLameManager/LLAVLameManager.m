//
//  LLAVLameManager.m
//  LLFileManager
//
//  Created by wangzhaomeng on 16/8/25.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LLAVLameManager.h"
#import <AVFoundation/AVFoundation.h>

@interface LLAVLameManager ()<AVAudioRecorderDelegate>

@property (nonatomic, strong) NSString *recordFilePath;       //录音存储路径
@property (nonatomic, strong) NSString *mp3FilePath;          //转码后的存储路径
@property (nonatomic, strong) AVAudioRecorder *audioRecorder;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, strong) AVAudioSession *audioSession;
@property (nonatomic, strong) NSString *fileName;

@end

@implementation LLAVLameManager

/**
 *  初始化录音设置
 *
 *  @param fileName 为录音命名(不用加后缀)
 *
 *  @return id
 */
- (id)initWithFileName:(NSString *)fileName{
    self = [super init];
    if (self) {
        _fileName = fileName;
        //录音设置
        NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
        //设置录音格式  AVFormatIDKey==kAudioFormatLinearPCM
        [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
        //设置录音采样率(Hz) 如：AVSampleRateKey==8000/44100/96000(影响音频的质量),采样率必须要设为11025才能使转化成mp3格式后不会失真
        [recordSetting setValue:[NSNumber numberWithFloat:11025.0] forKey:AVSampleRateKey];
        //录音通道数  1 或 2 ，要转换成mp3格式必须为双通道
        [recordSetting setValue:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
        //线性采样位数  8、16、24、32
        [recordSetting setValue:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
        //录音的质量
        [recordSetting setValue:[NSNumber numberWithInt:AVAudioQualityHigh] forKey:AVEncoderAudioQualityKey];
        //存储录音文件
        NSString *tureFileName = [NSString stringWithFormat:@"%@.caf",fileName];
        _recordFilePath = [NSTemporaryDirectory() stringByAppendingString:tureFileName];
        NSURL *url = [NSURL fileURLWithPath:_recordFilePath];
        //初始化
        _audioRecorder = [[AVAudioRecorder alloc] initWithURL:url settings:recordSetting error:nil];
        //开启音量检测
        _audioRecorder.meteringEnabled = YES;
        _audioRecorder.delegate = self;
    }
    return self;
}

/**
 *  开始录音
 */
- (BOOL)startRecord{
    if ([_audioRecorder isRecording]) {
        return NO;
    }
    _audioSession = [AVAudioSession sharedInstance];
    [_audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [_audioSession setActive:YES error:nil];
    
    [_audioRecorder prepareToRecord];
    [_audioRecorder peakPowerForChannel:0.0];
    return [_audioRecorder record];
}

/**
 *  结束录音，并将录音转码为mp3格式
 *
 *  @param completion 转码完成block
 */
- (void)stopRecord:(void(^)(NSString *fullPath, NSTimeInterval time))completion{
    if ([_audioRecorder isRecording]) {
        NSTimeInterval t = ceil(_audioRecorder.currentTime);
        [_audioRecorder stop];                          //录音停止
        [_audioSession setActive:NO error:nil];
        if (completion) {
            completion(_recordFilePath,t);
        }
    }
}

@end
