//
//  UIViewController+LLAddPart.h
//  LLFoundation
//
//  Created by wangzhaomeng on 16/11/22.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (LLAddPart)

///返回
- (void)ll_goBack;

///当前正在显示的控制器
- (UIViewController *)ll_visibleViewController;

///当前vc的view是否处于屏幕上
- (BOOL)ll_isVisible;

///强制转换屏幕方向
- (void)ll_interfaceOrientation:(UIInterfaceOrientation)orientation;

@end
