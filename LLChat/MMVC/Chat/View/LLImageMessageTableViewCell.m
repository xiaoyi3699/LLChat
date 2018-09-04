//
//  LLImageMessageTableViewCell.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLImageMessageTableViewCell.h"

@implementation LLImageMessageTableViewCell {
    UIImageView *_contentImageView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _contentImageView = [[UIImageView alloc] init];
        [self addSubview:_contentImageView];
    }
    return self;
}

- (void)setConfig:(LLImageMessageModel *)model {
    [super setConfig:model];
    
    _contentImageView.frame = _contentRect;
    _contentImageView.image = [UIImage imageNamed:@""];
    _contentImageView.backgroundColor = [UIColor redColor];
}

@end
