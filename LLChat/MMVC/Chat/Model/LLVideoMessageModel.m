//
//  LLVideoMessageModel.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/3.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLVideoMessageModel.h"

@implementation LLVideoMessageModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.msgType = LLMessageTypeVideo;
    }
    return self;
}

@end
