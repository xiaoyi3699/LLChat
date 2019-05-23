//
//  UIColor+LLAddPart.h
//  test
//
//  Created by wangzhaomeng on 16/8/16.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LLAddPart)

+ (UIColor *)ll_colorWithImage:(UIImage *)image;
+ (UIColor *)ll_colorWithHex:(NSInteger)hexValue;
+ (UIColor *)ll_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alpha;
+ (UIColor *)ll_colorWithHexString:(NSString *)hexString;
+ (UIColor *)ll_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
