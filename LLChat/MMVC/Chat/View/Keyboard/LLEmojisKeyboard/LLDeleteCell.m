//
//  LLDeleteCell.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/5.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLDeleteCell.h"

@implementation LLDeleteCell {
    UIImageView *_deleteImgView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _deleteImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 6, 40, 40)];
        _deleteImgView.image = [UIImage imageNamed:@"ll_chat_delete"];
        [self addSubview:_deleteImgView];
    }
    return self;
}

@end
