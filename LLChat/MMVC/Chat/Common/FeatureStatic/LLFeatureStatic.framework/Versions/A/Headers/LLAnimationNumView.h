//
//  LLAnimationNumView.h
//  LLCommonStatic
//
//  Created by WangZhaomeng on 2018/2/26.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLAnimationNumItemView.h"

typedef enum : NSInteger {
    LLAnimationPlacehloderTypeFront     = 0, //占位符在前面
    LLStatusBarStyleLightContentEnd,         //占位符在结尾
} LLAnimationPlacehloderType;

@interface LLAnimationNumView : UIView

///动画时长
@property (nonatomic, assign) CGFloat duration;
///数字背景色
@property (nonatomic, strong) UIColor *foreColor;
///数字颜色
@property (nonatomic, strong) UIColor *textColor;
///字体
@property (nonatomic, strong) UIFont  *font;
///相同数字是否有动画, 默认为NO
@property (nonatomic, assign) BOOL isSameAnimetion;
///无数字时的占位符, 默认为空字符
@property (nonatomic, strong) NSString *placeholder;
///占位符的位置
@property (nonatomic, assign) LLAnimationPlacehloderType placeholderType;

- (instancetype)initWithFrame:(CGRect)frame numText:(NSString *)numText spacing:(CGFloat)spacing;

- (void)refreshNumText:(NSString *)numText;

@end
