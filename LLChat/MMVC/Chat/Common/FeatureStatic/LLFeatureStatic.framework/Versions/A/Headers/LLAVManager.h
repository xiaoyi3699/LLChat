//
//  LLAVManager.h
//  LLFeature
//
//  Created by WangZhaomeng on 2017/11/10.
//  Copyright © 2017年 WangZhaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface LLAVManager : NSObject

///震动
+ (void)shake;

///播放默认音效
+ (void)playDefaultSoundID:(SystemSoundID)soundID;

///播放自定义音效
+ (void)playCustomSoundPath:(NSString *)path;

///提示音
+ (void)playStartSound;

///提示音
+ (void)playEndSound;

///mov格式转mp4格式
+ (void)movTransformToMP4WithPath:(NSString *)path outputPath:(NSString *)outputPath;

///视频剪辑
+ (void)clippingVideoWithPath:(NSString *)path outputPath:(NSString *)outputPath start:(Float64)start end:(Float64)end;

///视频合成
+ (void)splicingVideoWithPaths:(NSArray<NSString *> *)paths outputPath:(NSString *)outputPath;

@end
