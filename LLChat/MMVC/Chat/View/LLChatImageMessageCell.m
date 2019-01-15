//
//  LLChatImageMessageCell.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLChatImageMessageCell.h"

@implementation LLChatImageMessageCell {
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
    if ([[NSFileManager defaultManager] fileExistsAtPath:model.thumbnailPath]) {
        _contentImageView.image = [UIImage imageWithContentsOfFile:model.thumbnailPath];
    }
    else {
        if (model.thumbnail) {
            _contentImageView.image = LLCHAT_BAD_IMAGE;
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                NSURL *url = [NSURL URLWithString:[model.thumbnail ll_URLEncodedString]];
                NSData *data = [NSData dataWithContentsOfURL:url];
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIImage *image = [UIImage imageWithData:data];
                    if (image) {
                        model.thumbnailPath = [model saveThImage:image];
                        _contentImageView.image = image;
                    }
                });
            });
        }
        else {
            _contentImageView.image = LLCHAT_BAD_IMAGE;
        }
    }
}

@end
