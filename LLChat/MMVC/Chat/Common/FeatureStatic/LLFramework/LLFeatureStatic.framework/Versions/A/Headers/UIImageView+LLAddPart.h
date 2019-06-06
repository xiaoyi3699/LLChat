//
//  UIImageView+LLAddPart.h
//  LLFoundation
//
//  Created by wangzhaomeng on 16/11/7.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (LLAddPart)

///添加倒影
- (void)ll_reflection;

///画水印
- (void)setImage:(UIImage *)image withWaterMark:(UIImage *)mark inRect:(CGRect)rect;

@end
