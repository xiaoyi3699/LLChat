//
//  LLChatLogModel.m
//  LLFeatureStatic
//
//  Created by WangZhaomeng on 2018/9/26.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLChatLogModel.h"

@implementation LLChatLogModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.height = -1;
    }
    return self;
}

- (NSInteger)setConfigWithWidth:(NSInteger)width font:(UIFont *)font {
    if (self.height == -1) {
        self.height = MAX(ceil([self.text ll_heightWithWidth:width font:font]), 44);
    }
    return self.height;
}

@end
