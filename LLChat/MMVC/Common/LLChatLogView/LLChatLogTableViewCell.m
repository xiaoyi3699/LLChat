//
//  LLChatLogTableViewCell.m
//  LLFeatureStatic
//
//  Created by WangZhaomeng on 2018/9/26.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLChatLogTableViewCell.h"

@implementation LLChatLogTableViewCell {
    UILabel *_contentLabel;
    CGFloat _width;
}

- (instancetype)initWithWidth:(CGFloat)width style:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _width = width;
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.numberOfLines = 0;
        [self addSubview:_contentLabel];
    }
    return self;
}

- (void)setConfig:(LLChatLogModel *)model {
    _contentLabel.frame = CGRectMake(5, 0, _width-10, model.height+20);
    _contentLabel.attributedText = model.attributedText;
}

@end
