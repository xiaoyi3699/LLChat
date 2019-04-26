//
//  LLBaseMessageModel.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/3.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLBaseMessageModel.h"
#import <objc/runtime.h>
#import "LLChatModel.h"
#import "LLChatMacro.h"

//文本消息最大宽度
#define LL_TEXT_MSG_WIDTH (LLCHAT_SCREEN_WIDTH-127)
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
        if ([self isKindOfClass:[LLSystemMessageModel class]]) {
            self.modelH = 20;
            self.modelW = LLCHAT_SCREEN_WIDTH;
        }
        else if ([self isKindOfClass:[LLTextMessageModel class]]) {
            LLTextMessageModel *model = (LLTextMessageModel *)self;
            CGSize size = [model.message boundingRectWithSize:CGSizeMake(LL_TEXT_MSG_WIDTH, CGFLOAT_MAX)
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:[model contentAttributes]
                                                      context:nil].size;
            self.modelH = MAX(ceil(size.height), 30);
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

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

- (NSDictionary *)transfromDictionary {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    Class modelClass = object_getClass(self);
    unsigned int count = 0;
    objc_property_t *pros = class_copyPropertyList(modelClass, &count);
    
    for (int i = 0; i < count; i++) {
        objc_property_t pro = pros[i];
        NSString *name = [NSString stringWithFormat:@"%s", property_getName(pro)] ;
        id value = [self valueForKey:name];
        if (value != nil) {
            [dic setValue:value forKey:name];
        }
    }
    free(pros);
    
    Class superClass = [self superclass];
    unsigned int superCount = 0;
    objc_property_t *superPros = class_copyPropertyList(superClass, &superCount);
    
    for (int i = 0; i < superCount; i++) {
        objc_property_t pro = superPros[i];
        NSString *name = [NSString stringWithFormat:@"%s", property_getName(pro)] ;
        id value = [self valueForKey:name];
        if (value != nil) {
            [dic setValue:value forKey:name];
        }
    }
    free(superPros);
    
    return dic;
}

@end
