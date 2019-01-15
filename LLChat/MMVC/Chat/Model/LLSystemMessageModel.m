//
//  LLSystemMessageModel.m
//  LLChat
//
//  Created by WangZhaomeng on 2019/1/15.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//

#import "LLSystemMessageModel.h"

@implementation LLSystemMessageModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.msgType = LLMessageTypeSystem;
    }
    return self;
}

@end
