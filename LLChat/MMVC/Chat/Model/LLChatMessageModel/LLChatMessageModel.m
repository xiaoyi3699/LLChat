//
//  LLChatMessageModel.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/3.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLChatMessageModel.h"

@implementation LLChatMessageModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.modelH = -1;
        self.modelW = -1;
        self.mid = [NSString stringWithFormat:@"%@",@([LLChatHelper nowTimestamp])];
    }
    return self;
}

///将字典转化为model
+ (instancetype)modelWithDic:(NSDictionary *)dic {
    LLChatMessageModel *model = [[LLChatMessageModel alloc] init];
    for (NSString *key in dic.allKeys) {
        [model setValue:[dic objectForKey:key] forKey:key];
    }
    return model;
}

#pragma mark - 消息的自定义处理
///缓存model尺寸
- (void)cacheModelSize {
    if (self.modelH == -1 || self.modelW == -1) {
        if (self.msgType == LLMessageTypeSystem) {
            self.modelH = 20;
            self.modelW = LLCHAT_SCREEN_WIDTH;
        }
        else if (self.msgType == LLMessageTypeText) {
            CGSize size = [self.message boundingRectWithSize:CGSizeMake((LLCHAT_SCREEN_WIDTH-127), CGFLOAT_MAX)
                                                     options:NSStringDrawingUsesLineFragmentOrigin
                                                  attributes:[self contentAttributes]
                                                     context:nil].size;
            self.modelH = MAX(ceil(size.height), 30);
            self.modelW = MAX(ceil(size.width), 30);
        }
        else if (self.msgType == LLMessageTypeImage) {
            [self handleImageSize];
            self.modelH = self.imgH;
            self.modelW = self.imgW;
        }
        else if (self.msgType == LLMessageTypeVoice) {
            
        }
        else if (self.msgType == LLMessageTypeVideo) {
            
        }
    }
}

//文本样式
- (NSDictionary<NSAttributedStringKey,id> *)contentAttributes {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 5;
    return @{NSFontAttributeName:[UIFont systemFontOfSize:15],NSParagraphStyleAttributeName:[style copy]};
}

//缓存图片尺寸
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
