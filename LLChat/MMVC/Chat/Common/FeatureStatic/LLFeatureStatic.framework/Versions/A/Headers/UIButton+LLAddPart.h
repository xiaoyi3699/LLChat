//
//  UIButton+LLAddPart.h
//  LLFoundation
//
//  Created by WangZhaomeng on 2017/8/31.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LLAddPart)

#pragma mark - 初始化快捷方式

/**
 *  图片按钮
 *
 *  @param frame   位置
 *  @param bgImage 背景图
 *
 *  @return 图片按钮
 */
+ (instancetype)buttonWithFrame:(CGRect)frame
                        bgImage:(UIImage*)bgImage;

/**
 *  图片背景文字按钮
 *
 *  @param frame      位置
 *  @param image      背景图
 *  @param title      标题
 *  @param titleColor 标题颜色(传nil表示使用默认值)
 *  @param font       字体(传nil表示使用默认值)
 *
 *  @return 按钮
 */
+ (instancetype)buttonWithFrame:(CGRect)frame
                        bgImage:(UIImage*)image
                          title:(NSString*)title
                     titleColor:(UIColor*)titleColor
                           font:(UIFont*)font;

/**
 *  图文按钮
 *
 *  @param frame      位置
 *  @param image      图片
 *  @param title      标题
 *  @param titleColor 标题颜色(传nil表示使用默认值)
 *  @param font       标题字体(传nil表示使用默认值)
 *
 *  @return 图文按钮
 */
+ (instancetype)buttonWithFrame:(CGRect)frame
                          image:(UIImage*)image
                          title:(NSString*)title
                     titleColor:(UIColor*)titleColor
                           font:(UIFont*)font;

#pragma mark - 附加方法

/**
 *  设置标题
 *
 *  @param title      标题
 *  @param titleColor 标题颜色(传nil表示使用默认值)
 *  @param font       标题字体(传nil表示使用默认值)
 */
- (void)setTitle:(NSString*)title titleColor:(UIColor*)titleColor font:(UIFont*)font;

@end
