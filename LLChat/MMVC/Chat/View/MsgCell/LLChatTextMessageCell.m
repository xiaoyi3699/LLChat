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
        _contentLabel.numberOfLines = 0;
        [self addSubview:_contentLabel];
    }
    return self;
}

- (void)setConfig:(LLChatMessageModel *)model isShowName:(BOOL)isShowName {
    [super setConfig:model isShowName:isShowName];
    
//    NSArray *emoticons = [[LLEmoticonManager manager] matchEmoticons:model.message];
//    NSAttributedString *str = [[NSAttributedString alloc] initWithString:model.message attributes:[model contentAttributes]];
    
    NSMutableAttributedString *att = [[LLEmoticonManager manager] attributedString:model.message];
    [att addAttributes:[model contentAttributes] range:NSMakeRange(0, att.length)];
    _contentLabel.frame = _contentRect;
    _contentLabel.attributedText = att;
}

@end
