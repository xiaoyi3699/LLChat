//
//  LLEmojisCell.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/5.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLEmojisCell.h"

@implementation LLEmojisCell {
    UILabel *_emojisLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _emojisLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        _emojisLabel.font = [UIFont systemFontOfSize:35];
        _emojisLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_emojisLabel];
    }
    return self;
}

- (void)setConfig:(NSString *)emojis {
    _emojisLabel.text = emojis;
}

@end
