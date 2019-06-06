//
//  UIView+AddPart.h
//  test
//
//  Created by wangzhaomeng on 16/8/5.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LLAddPart)

/**
 获取view所在的ViewController
 */
- (UIViewController *)viewController;

/**
 判断view是不是指定视图的子视图
 */
- (BOOL)ll_isDescendantOfView:(UIView *)otherView;

#pragma mark - 自定义适配
//设置位置(宽和高保持不变)
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

//设置位置(其他顶点保持不变)
- (CGFloat)mutableMinX;
- (void)setMutableMinX:(CGFloat)mutableMinX;

- (CGFloat)mutableMaxX;
- (void)setMutableMaxX:(CGFloat)mutableMaxX;

- (CGFloat)mutableMinY;
- (void)setMutableMinY:(CGFloat)mutableMinY;

- (CGFloat)mutableMaxY;
- (void)setMutableMaxY:(CGFloat)mutableMaxY;

//设置宽和高((位置不变))
- (CGFloat)LLWidth;
- (void)setLLWidth:(CGFloat)LLWidth;

- (CGFloat)LLHeight;
- (void)setLLHeight:(CGFloat)LLHeight;

- (CGSize)LLSize;
- (void)setLLSize:(CGSize)LLSize;

//设置宽和高(中心点不变)
- (CGFloat)center_width;
- (void)setCenter_width:(CGFloat)center_width;

- (CGFloat)center_height;
- (void)setCenter_height:(CGFloat)center_height;

- (CGSize)center_size;
- (void)setCenter_size:(CGSize)center_size;

//设置宽高比例
- (CGFloat)LLScale;
- (void)setScale:(CGFloat)scale x:(CGFloat)x y:(CGFloat)y maxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight;

//设置圆角
- (void)setLLCornerRadius:(CGFloat)LLCornerRadius;
- (CGFloat)LLCornerRadius;

/**
 设置圆角、边框
 */
- (void)setCornerRadius:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor *)color;

/**
 设置阴影
 */
- (void)setShadowRadius:(CGFloat)radius offset:(CGFloat)offset color:(UIColor *)color alpha:(CGFloat)alpha;

/**
 设置阴影
 */
- (void)setShadowOffset:(CGFloat)offset color:(UIColor *)color opacity:(CGFloat)opacity shadowType:(LLShadowType)shadowType;

/**
 有3d效果的旋转背景动画(定时器自动旋转)
 */
- (void)ll_3dAlertBackgroundAnimationAuto:(NSTimeInterval)duration;

/**
 有3d效果的旋转背景动画
 */
- (void)ll_3dAlertBackgroundAnimation:(NSTimeInterval)duration;

/**
 旋转动画(参数axis:坐标轴(x,y或z,小写))
 */
- (void)startRotationAxis:(NSString *)axis duration:(NSTimeInterval)duration repeatCount:(NSInteger)repeatCount;

/**
 旋转角度(x、y、z)
 */
- (void)transform3DMakeRotationX:(CGFloat)angleX Y:(CGFloat)angleY Z:(CGFloat)angleZ;

/**
 放大系数(x、y、z)
 */
- (void)transform3DMakeScaleX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z;

/**
 alertView弹出动画
 */
- (void)outFromCenterNoneWithDuration:(NSTimeInterval)duration;

/**
 alertView消失动画
 */
- (void)dismissToCenterNoneWithDuration:(NSTimeInterval)duration;

/**
 alertView弹出动画
 */
- (void)outFromCenterAnimationWithDuration:(NSTimeInterval)duration;

/**
 alertView消失动画
 */
- (void)dismissToCenterAnimationWithDuration:(NSTimeInterval)duration;

/**
 先放大后缩小的动画
 */
- (void)outAnimation;

/**
 先缩小后放大的动画
 */
- (void)insideAnimation;

#pragma mark - 转场动画
- (void)transitionFromLeftWithType:(AnimationType)type duration:(NSTimeInterval)duration completion:(doBlock)completion;

- (void)transitionFromRightWithType:(AnimationType)type duration:(NSTimeInterval)duration completion:(doBlock)completion;

- (void)transitionFromTopWithType:(AnimationType)type duration:(NSTimeInterval)duration completion:(doBlock)completion;

- (void)transitionFromBottomWithType:(AnimationType)type duration:(NSTimeInterval)duration completion:(doBlock)completion;

/**
 旋转180°缩小到最小,然后再从小到大推出
 */
- (void)transform0:(doBlock)transform completion:(doBlock)completion;

/**
 向右旋转45°缩小到最小,然后再从小到大推出
 */
- (void)transform1:(doBlock)transform completion:(doBlock)completion;

/**
 添加任意圆角
 */
- (void)LL_addCorners:(UIRectCorner)corner radius:(CGFloat)radius;

///渐变
- (void)ll_gradientColors:(NSArray *)colors gradientType:(LLGradientType)type;

- (void)ll_gradientColorWithGradientType:(LLGradientType)type;

///将一个view保存为pdf格式
- (BOOL)ll_savePDFToDocumentsWithFileName:(NSString *)aFilename;

/**
 绘制虚线
 **/
- (void)ll_drawlineInFrame:(CGRect)frame
                    length:(CGFloat)lineLength
               lineSpacing:(CGFloat)lineSpacing
                 lineColor:(UIColor *)lineColor
              isHorizontal:(BOOL)isHorizontal;

/**
 绘制网格
 **/
- (void)ll_drawGridInFrame:(CGRect)frame
                    length:(CGFloat)lineLength
               lineSpacing:(CGFloat)lineSpacing
                 lineColor:(UIColor *)lineColor;

@end
