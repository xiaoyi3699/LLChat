//
//  LLImageMessageModel.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/3.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLImageMessageModel.h"

@implementation LLImageMessageModel {
    NSString *_cachePath;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.msgType = LLMessageTypeImage;
        _cachePath = LLCHAT_APP_CACHE_PATH;
    }
    return self;
}

//图片比例计算
- (void)handleImageSize {
    CGFloat maxW = ceil(LLCHAT_SCREEN_WIDTH*0.32)*1.0;
    CGFloat maxH = ceil(LLCHAT_SCREEN_WIDTH*0.32)*1.0;
    CGFloat imgScale = self.imgW*1.0/self.imgH;
    CGFloat viewScale = maxW*1.0/maxH;
    
    CGFloat w, h;
    if (imgScale > viewScale) {
        w = maxW;
        h = self.imgH*maxW*1.0/self.imgW;
    }
    else if (imgScale < viewScale) {
        h = maxH;
        w = self.imgW*maxH*1.0/self.imgH;
    }
    else {
        w = maxW;
        h = maxH;
    }
    self.imgW = ceil(w);
    self.imgH = ceil(h)+ceil(17.0/self.imgW*h-10);
    
    if (imgScale != viewScale) {
        if (self.imgW > maxW) {
            h = self.imgH*maxW*1.0/self.imgW;
            self.imgW = maxW;
        }
        if (self.imgH > maxH) {
            w = self.imgW*maxH*1.0/self.imgH;
            h = maxH;
        }
        self.imgW = ceil(w);
        self.imgH = ceil(h);
    }
}

@end
