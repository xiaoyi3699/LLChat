//
//  UILabel+LLAddPart.h
//  LLFoundation
//
//  Created by Mr.Wang on 16/12/21.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LLAddPart)

///文字渐变
- (void)ll_textGradientColors:(NSArray *)colors gradientType:(LLGradientType)type;

///文字渐变
- (void)ll_textGradientColorWithGradientType:(LLGradientType)type;

@end
