//
//  LLCycleView.h
//  LLCommonStatic
//
//  Created by WangZhaomeng on 2018/3/21.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLBezierView.h"

@interface LLCycleView : UIView

/**
 初始化
 
 @param center 圆心坐标
 @param x      x轴半径
 @param y      y轴半径
 @param start  初始角度
 @param speed  公转速度
 @param rate   自转速率倍数(自转速率=speed*rate 0表示不自转, 1表示自转速度与公转速度一致, 负数表示自转角度与公转角度相反)
 @param line   是否显示圆心到视图中心的连线
 @return 本类对象
 */
- (instancetype)initWithCenter:(CGPoint)center radiusX:(CGFloat)x radiusY:(CGFloat)y start:(CGFloat)start speed:(CGFloat)speed rate:(CGFloat)rate line:(BOOL)line;

- (void)showInView:(UIView *)superView animationView:(UIView *)animationView;

@end
