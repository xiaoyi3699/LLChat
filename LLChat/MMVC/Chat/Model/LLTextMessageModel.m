//
//  LLTextMessageModel.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/3.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLTextMessageModel.h"

@implementation LLTextMessageModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.msgType = LLMessageTypeText;
    }
    return self;
}

- (NSDictionary<NSAttributedStringKey,id> *)contentAttributes {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 5;
    return @{NSFontAttributeName:[UIFont systemFontOfSize:15],NSParagraphStyleAttributeName:[style copy]};
}

@end
