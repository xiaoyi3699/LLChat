//
//  UIView+LLChat.h
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LLChat)

/**
 获取view所在的ViewController
 */
- (UIViewController *)viewController;

/**
 判断view是不是指定视图的子视图
 */
- (BOOL)ll_isDescendantOfView:(UIView *)otherView;

#pragma mark - 自定义适配
- (CGFloat)minX;
- (void)setMinX:(CGFloat)minX;

- (CGFloat)maxX;
- (void)setMaxX:(CGFloat)maxX;

- (CGFloat)minY;
- (void)setMinY:(CGFloat)minY;

- (CGFloat)maxY;
- (void)setMaxY:(CGFloat)maxY;

- (CGFloat)LLCenterX;
- (void)setLLCenterX:(CGFloat)LLCenterX;

- (CGFloat)LLCenterY;
- (void)setLLCenterY:(CGFloat)LLCenterY;

- (CGPoint)LLPostion;
- (void)setLLPostion:(CGPoint)LLPostion;

- (CGFloat)LLWidth;
- (void)setLLWidth:(CGFloat)LLWidth;

- (CGFloat)LLHeight;
- (void)setLLHeight:(CGFloat)LLHeight;

- (CGSize)LLSize;
- (void)setLLSize:(CGSize)LLSize;

///设置圆角
- (void)setLLCornerRadius:(CGFloat)LLCornerRadius;

@end
