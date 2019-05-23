//
//  LLAnimationNumItemView.h
//  LLCommonStatic
//
//  Created by WangZhaomeng on 2018/2/24.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//  数字轮播动画

#import <UIKit/UIKit.h>

@interface LLAnimationNumItemView : UIView

@property (nonatomic, assign) CGFloat duration;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont  *font;
@property (nonatomic, assign) BOOL isSameAnimetion;

- (instancetype)initWithFrame:(CGRect)frame text:(NSString *)text;

- (void)refreshText:(NSString *)text;

@end
