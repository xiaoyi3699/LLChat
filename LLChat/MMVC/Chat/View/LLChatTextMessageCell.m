//
//  LLChatTextMessageCell.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLChatTextMessageCell.h"

@implementation LLChatTextMessageCell {
    UILabel *_contentLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = [UIColor darkTextColor];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.font = LL_TEXT_MSG_FONT;
        _contentLabel.numberOfLines = 0;
        [self addSubview:_contentLabel];
    }
    return self;
}

- (void)setConfig:(LLTextMessageModel *)model {
    [super setConfig:model];
    
    _contentLabel.frame = _contentRect;
    _contentLabel.text = model.message;
}

@end
