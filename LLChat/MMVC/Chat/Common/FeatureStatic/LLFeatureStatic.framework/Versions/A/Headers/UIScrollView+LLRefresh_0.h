//
//  UIScrollView+LLRefresh_0.h
//  LLFeature
//
//  Created by WangZhaomeng on 2017/11/25.
//  Copyright © 2017年 WangZhaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLHeaderView_0.h"
#import "LLFooterView_0.h"

@interface UIScrollView (LLRefresh_0)

- (void)setLLRefreshHeader_0:(LLHeaderView_0 *)aRefreshHeader;
- (LLHeaderView_0 *)LLRefreshHeader_0;

- (void)setLLRefreshFooter_0:(LLFooterView_0 *)aRefreshFooter;
- (LLFooterView_0 *)LLRefreshFooter_0;

@end
