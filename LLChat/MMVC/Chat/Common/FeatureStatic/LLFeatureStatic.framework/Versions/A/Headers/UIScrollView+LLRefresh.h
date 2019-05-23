//
//  UITableView+LLRefresh.h
//  refresh
//
//  Created by zhaomengWang on 17/3/16.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLRefreshHeaderView.h"
#import "LLRefreshFooterView.h"

@interface UIScrollView (LLRefresh)

- (void)setLLRefreshHeader:(LLRefreshHeaderView *)aRefreshHeader;
- (LLRefreshHeaderView *)LLRefreshHeader;

- (void)setLLRefreshFooter:(LLRefreshFooterView *)aRefreshFooter;
- (LLRefreshFooterView *)LLRefreshFooter;

@end
