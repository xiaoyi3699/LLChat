//
//  LLAVLameManager.h
//  LLFileManager
//
//  Created by wangzhaomeng on 16/8/25.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//  录音/视频、音频剪辑

#import <Foundation/Foundation.h>

/*
 使用时，必须创建全局变量
 */
@interface LLAVLameManager : NSObject

- (id)initWithFileName:(NSString *)fileName;
- (BOOL)startRecord;
- (void)stopRecord:(void(^)(NSString *fullPath, NSTimeInterval time))completion;

@end
