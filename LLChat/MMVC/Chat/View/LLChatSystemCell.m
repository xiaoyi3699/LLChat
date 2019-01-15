//
//  LLChatSystemCell.m
//  LLChat
//
//  Created by WangZhaomeng on 2019/1/15.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//

#import "LLChatSystemCell.h"

@implementation LLChatSystemCell {
    UILabel *_messageLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, LL_SCREEN_WIDTH, 20)];
        _messageLabel.font = LL_SYSTEM_MSG_FONT;
        _messageLabel.textColor = [UIColor colorWithRed:100/255. green:100/255. blue:100/255. alpha:1];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_messageLabel];
    }
    return self;
}

- (void)setConfig:(LLBaseMessageModel *)model {
    _messageLabel.text = model.message;
}

@end
