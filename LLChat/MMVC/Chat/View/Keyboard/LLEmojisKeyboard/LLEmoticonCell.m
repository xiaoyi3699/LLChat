//
//  LLEmoticonCell.m
//  LLChat
//
//  Created by WangZhaomeng on 2019/5/16.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//

#import "LLEmoticonCell.h"

@implementation LLEmoticonCell {
    UIImageView *_emoticonImageView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _emoticonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 35, 35)];
        [self addSubview:_emoticonImageView];
    }
    return self;
}

- (void)setConfig:(NSDictionary *)dic {
    NSString *imageName = [dic objectForKey:@"png"];
    UIImage *image = [UIImage imageNamed:imageName];
    _emoticonImageView.image = image;
}

@end
