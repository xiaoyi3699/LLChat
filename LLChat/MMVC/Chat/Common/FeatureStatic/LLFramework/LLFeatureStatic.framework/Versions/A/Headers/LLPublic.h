//
//  LLPublic.h
//  LLFeatureStatic
//
//  Created by WangZhaomeng on 2019/5/20.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLPublic : NSObject

+ (instancetype)Public;

///还原, 如屏幕旋转时
- (void)reset;
///是否是iPad
- (BOOL)iPad;
///是否是iPhone
- (BOOL)iPhone;
///是否是iPhoneX
- (BOOL)iPhoneX;
///导航高
- (CGFloat)navBarH;
///状态栏高
- (CGFloat)statusH;
///taBar高
- (CGFloat)tabBarH;
///屏幕宽
- (CGFloat)screenW;
///屏幕高
- (CGFloat)screenH;
///屏幕scale
- (CGFloat)screenScale;
///屏幕bounds
- (CGRect)screenBounds;
///iPhoneX底部高度
- (CGFloat)iPhoneXBottomH;

///系统版本
- (CGFloat)systemV;
///build版本
- (NSString *)buildV;
///short版本
- (NSString *)shortV;
///应用名称
- (NSString *)appName;
///temp
- (NSString *)temp;
///cache
- (NSString *)cache;
///document
- (NSString *)document;

@end
