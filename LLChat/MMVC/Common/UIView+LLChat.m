//
//  UIView+LLChat.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "UIView+LLChat.h"

@implementation UIView (LLChat)

- (UIViewController *)viewController{
    UIResponder *next = [self nextResponder];
    do{
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next);
    return nil;
}

- (BOOL)ll_isDescendantOfView:(UIView *)otherView {
    return [self isDescendantOfView:otherView];
}

#pragma - mark 自定义适配
- (CGFloat)minX{
    return CGRectGetMinX(self.frame);
}

- (void)setMinX:(CGFloat)minX{
    CGRect rect = self.frame;
    rect.origin.x = minX;
    self.frame = rect;
}

- (CGFloat)maxX{
    return CGRectGetMaxX(self.frame);
}

- (void)setMaxX:(CGFloat)maxX{
    CGRect rect = self.frame;
    rect.origin.x = maxX-CGRectGetWidth(rect);
    self.frame = rect;
}

- (CGFloat)minY{
    return CGRectGetMinY(self.frame);
}

- (void)setMinY:(CGFloat)minY{
    CGRect rect = self.frame;
    rect.origin.y = minY;
    self.frame = rect;
}

- (CGFloat)maxY{
    return CGRectGetMaxY(self.frame);
}

- (void)setMaxY:(CGFloat)maxY{
    CGRect rect = self.frame;
    rect.origin.y = maxY-CGRectGetHeight(rect);
    self.frame = rect;
}

- (CGFloat)LLCenterX{
    return CGRectGetMidX(self.frame);
}

- (void)setLLCenterX:(CGFloat)LLCenterX{
    self.center = CGPointMake(LLCenterX, CGRectGetMidY(self.frame));
}

- (CGFloat)LLCenterY{
    return CGRectGetMidY(self.frame);
}

- (void)setLLCenterY:(CGFloat)LLCenterY{
    self.center = CGPointMake(CGRectGetMidX(self.frame), LLCenterY);
}

- (CGPoint)LLPostion{
    return CGPointMake(self.minX, self.minY);
}

- (void)setLLPostion:(CGPoint)LLPostion{
    CGRect rect = self.frame;
    rect.origin.x = LLPostion.x;
    rect.origin.y = LLPostion.y;
    self.frame = rect;
}

- (CGFloat)LLWidth{
    return CGRectGetWidth(self.frame);
}

- (void)setLLWidth:(CGFloat)LLWidth{
    CGRect rect = self.frame;
    rect.size.width = LLWidth;
    self.frame = rect;
}

- (CGFloat)LLHeight{
    return CGRectGetHeight(self.frame);
}

- (void)setLLHeight:(CGFloat)LLHeight{
    CGRect rect = self.frame;
    rect.size.height = LLHeight;
    self.frame = rect;
}

- (CGSize)LLSize{
    return CGSizeMake(self.LLWidth, self.LLHeight);
}

- (void)setLLSize:(CGSize)LLSize{
    CGRect rect = self.frame;
    rect.size.width = LLSize.width;
    rect.size.height = LLSize.height;
    self.frame = rect;
}

- (void)setLLCornerRadius:(CGFloat)LLCornerRadius{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = LLCornerRadius;
}

@end
