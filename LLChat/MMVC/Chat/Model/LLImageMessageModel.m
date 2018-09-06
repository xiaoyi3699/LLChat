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
        _cachePath = APP_CachePath;
    }
    return self;
}

//图片比例计算
- (void)handleImageSize {
    CGFloat maxW = ceil(LL_SCREEN_WIDTH/3.0);
    CGFloat maxH = ceil(LL_SCREEN_HEIGHT/2.0);
    
    CGFloat imgScale = self.imgW*1.0/self.imgH;
    CGFloat viewScale = maxW*1.0/maxH;
    
    CGFloat w, h;
    if (imgScale > viewScale) {
        w = maxW;
        h = self.imgH*maxW/self.imgW;
    }
    else if (imgScale < viewScale) {
        h = maxH;
        w = self.imgW*maxH/self.imgH;
    }
    else {
        w = maxW;
        h = maxH;
    }
    self.imgW = ceil(w);
    self.imgH = ceil(h);
}

- (NSString *)saveOrImage:(UIImage *)image {
    NSString *filePath = [NSString stringWithFormat:@"%@/or_%@.png",_cachePath,@(self.timestamp)];
    NSData *data = UIImagePNGRepresentation(image);
    if ([data writeToFile:filePath atomically:YES]) {
        return filePath;
    }
    return @"";
}

- (NSString *)saveThImage:(UIImage *)image {
    NSString *filePath = [NSString stringWithFormat:@"%@/th_%@.png",_cachePath,@(self.timestamp)];
    NSData *data = UIImagePNGRepresentation(image);
    if ([data writeToFile:filePath atomically:YES]) {
        return filePath;
    }
    return @"";
}

@end
