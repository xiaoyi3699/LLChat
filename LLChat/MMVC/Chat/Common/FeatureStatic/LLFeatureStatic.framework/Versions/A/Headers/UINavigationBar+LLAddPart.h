//
//  UINavigationBar+LLAddPart.h
//  LLFeature
//
//  Created by WangZhaomeng on 2017/9/28.
//  Copyright © 2017年 WangZhaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (LLAddPart)

- (void)ll_setBackgroundColor:(UIColor *)backgroundColor;
- (void)ll_setElementsAlpha:(CGFloat)alpha;
- (void)ll_setTranslationY:(CGFloat)translationY;
- (void)ll_reset;

@end
