//
//  LLBaseMessageModel.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/3.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLBaseMessageModel.h"

@implementation LLBaseMessageModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.modelH = -1;
        self.modelW = -1;
    }
    return self;
}

- (void)cacheModelSize {
    if (self.modelH == -1 || self.modelW == -1) {
        if ([self isKindOfClass:[LLTextMessageModel class]]) {
            LLTextMessageModel *model = (LLTextMessageModel *)self;
            CGSize size = [model.content boundingRectWithSize:CGSizeMake(LL_TEXT_CONTENT_W, CGFLOAT_MAX)
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:[model contentAttributes]
                                                      context:nil].size;
            self.modelH = ceil(size.height);
            self.modelW = MAX(ceil(size.width), 30);
        }
        else if ([self isKindOfClass:[LLImageMessageModel class]]) {
            LLImageMessageModel *model = (LLImageMessageModel *)self;
            [model handleImageSize];
            self.modelH = model.imgH;
            self.modelW = model.imgW;
        }
        else if ([self isKindOfClass:[LLVoiceMessageModel class]]) {
            LLVoiceMessageModel *model = (LLVoiceMessageModel *)self;
        }
        else if ([self isKindOfClass:[LLVideoMessageModel class]]) {
            LLVideoMessageModel *model = (LLVideoMessageModel *)self;
        }
    }
}

@end
