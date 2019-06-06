//
//  LLAlertView.h
//  LLFoundation
//
//  Created by lhy on 16/8/17.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLAlertView : UIView

@property (nonatomic, strong) UIColor *cancelColor;
@property (nonatomic, strong) UIColor *OKColor;

- (id)initWithTitle:(NSString *)title message:(NSString *)message OKButtonTitle:(NSString *)OKButtonTitle cancelButtonTitle:(NSString *)cancelButtonTitle type:(LLAlertViewType)type;

- (void)showAnimated:(BOOL)animated;

/**
 设置取消按钮的点击事件
 */
- (void)setCannelBlock:(doBlock)cannelBlock;

/**
 设置确定按钮的点击事件
 */
- (void)setOKBlock:(doBlock)OKBlock;

@end
