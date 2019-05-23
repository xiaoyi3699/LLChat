//
//  LLRefreshHelper.h
//  LLFeature
//
//  Created by WangZhaomeng on 2017/10/25.
//  Copyright © 2017年 WangZhaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LLRefreshHeaderHeight 60
#define LLRefreshFooterHeight 60
#define LL_REFRESH_COLOR      R_G_B(50, 50, 50)
#define LL_TIME_COLOR         R_G_B(50, 50, 50)
#define LL_REFRESH_FONT       [UIFont boldSystemFontOfSize:13]
#define LL_TIME_FONT          [UIFont boldSystemFontOfSize:13]
#define LL_TRANS_FORM CATransform3DConcat(CATransform3DIdentity, CATransform3DMakeRotation(M_PI+0.000001, 0, 0, 1))

extern NSString *const LLRefreshMoreData;
extern NSString *const LLRefreshHeaderTime;
extern NSString *const LLRefreshKeyPathPanState;
extern NSString *const LLRefreshKeyPathContentSize;
extern NSString *const LLRefreshKeyPathContentOffset;

/** 刷新控件的状态 */
typedef NS_ENUM(NSInteger, LLRefreshState) {
    
    LLRefreshStateNormal          = 0, //普通状态
    LLRefreshStateWillRefresh,         //松开就刷新的状态
    LLRefreshStateRefreshing,          //正在刷新中的状态
    LLRefreshStateNoMoreData           //没有更多的数据
};

@interface LLRefreshHelper : NSObject

/** 获取上次更新时间 */
+ (NSString *)LL_getRefreshTime:(NSString *)key;

/** 重置更新时间 */
+ (void)LL_setRefreshTime:(NSString *)key;

/** 箭头 */
+ (UIImage *)LL_ArrowImage;

@end
