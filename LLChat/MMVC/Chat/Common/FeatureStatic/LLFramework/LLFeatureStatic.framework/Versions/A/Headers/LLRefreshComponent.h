//
//  LLRefreshComponent.h
//  refresh
//
//  Created by zhaomengWang on 17/3/24.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLRefreshHelper.h"

@interface LLRefreshComponent : UIView{
    LLRefreshState _refreshState;
    UILabel *_messageLabel;
    UILabel *_laseTimeLabel;
}

@property (nonatomic, strong) UIImageView *arrowView;
@property (nonatomic, strong) UIActivityIndicatorView *loadingView;

/** 是否处于刷新状态 */
@property (nonatomic, assign) BOOL isRefreshing;

/** 回调对象 */
@property (nonatomic, weak) id refreshingTarget;

/** 回调方法 */
@property (nonatomic, assign) SEL refreshingAction;

#pragma mark - 交给子类去访问
/** 父控件 */
@property (weak,   nonatomic, readonly) UIScrollView *scrollView;

#pragma mark - 交给子类们去实现
/** 普通状态 */
- (void)LL_RefreshNormal NS_REQUIRES_SUPER;

/** 松开就刷新的状态 */
- (void)LL_WillRefresh NS_REQUIRES_SUPER;

/** 没有更多的数据 */
- (void)LL_NoMoreData NS_REQUIRES_SUPER;

/** 正在刷新中的状态 */
- (void)LL_BeginRefresh NS_REQUIRES_SUPER;

/** 刷新结束 */
- (void)LL_EndRefresh:(BOOL)more NS_REQUIRES_SUPER;

/** 刷新结束 */
- (void)LL_EndRefresh;

/** 初始化 */
- (void)prepare NS_REQUIRES_SUPER;

/** 创建子视图 */
- (void)createViews;

/** 当scrollView的contentOffset发生改变的时候调用 */
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change;

/** 当scrollView的contentSize发生改变的时候调用 */
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change;

/** 当scrollView的拖拽状态发生改变的时候调用 */
- (void)scrollViewPanStateDidChange:(NSDictionary *)change;

/** 更新刷新控件的状态 */
- (void)updateRefreshState:(LLRefreshState)refreshState;

/** 移除kvo监听 */
- (void)removeObservers;

@end
