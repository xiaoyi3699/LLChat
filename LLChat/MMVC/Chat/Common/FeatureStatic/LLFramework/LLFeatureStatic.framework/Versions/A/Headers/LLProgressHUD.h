//
//  LLProgressHUD.h
//  LLFeature
//
//  Created by WangZhaomeng on 2017/10/26.
//  Copyright © 2017年 WangZhaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLProgressView : UIView

@end

@interface LLProgressConfig : NSObject

///背景色
@property (nonatomic, strong) UIColor *backgroundColor;
///圆环色
@property (nonatomic, strong) UIColor *progressColor;
///文本色
@property (nonatomic, strong) UIColor *textColor;
///文本字体
@property (nonatomic, strong) UIFont *font;

+ (instancetype)defaultConfig;

@end

@interface LLProgressHUD : UIView

///是否正在显示
@property (nonatomic, assign) BOOL show;
///是否允许操作
@property (nonatomic, assign) BOOL userEnabled;

+ (instancetype)defaultHUD;
+ (void)setProgressConfig:(LLProgressConfig *)config;
+ (void)showInfoMessage:(NSString *)message;
+ (void)showProgressMessage:(NSString *)message;
+ (void)dismiss;

@end
