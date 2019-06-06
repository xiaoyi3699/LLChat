//
//  LLViewHandle.h
//  test
//
//  Created by XHL on 16/8/16.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLViewHandle : UIView

+ (void)showInfoMessage:(NSString *)message;
+ (void)showProgressMessage:(NSString *)message;
+ (void)dismiss;

/**
 在状态栏显示网络加载的齿轮图标
 */
+ (void)setNetworkActivityIndicatorVisible:(BOOL)visible;

/**
 当前展示的视图控制器
 */
+ (UIViewController *)theTopViewControler;

///寻找导航栏黑线
+ (UIImageView *)findShadowImageView:(UIView *)view;

@end
