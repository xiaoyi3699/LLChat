//
//  LLRefreshFooterView.h
//  refresh
//
//  Created by zhaomengWang on 17/3/16.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import "LLRefreshComponent.h"

@interface LLRefreshFooterView : LLRefreshComponent

+ (instancetype)footerWithRefreshingTarget:(id)target refreshingAction:(SEL)action;

@end
