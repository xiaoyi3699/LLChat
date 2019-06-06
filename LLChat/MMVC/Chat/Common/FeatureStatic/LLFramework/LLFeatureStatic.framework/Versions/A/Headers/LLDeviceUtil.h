//
//  LLDeviceUtil.h
//  LLFoundation
//
//  Created by wangzhaomeng on 16/8/17.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLDeviceUtil : NSObject

///CPU使用量
+ (CGFloat)ll_cpuUsage;

/**
 屏蔽触发事件
 */
+ (void)beginIgnoringInteractionEventsDuration:(NSTimeInterval)duration;

/**
 是否禁止锁屏
 */
+ (void)isLockScreenDisabled:(BOOL)disabled;

/**
 获取当前iOS版本
 */
+ (float)getDeviceSystemMajorVersion;

/**
 隐藏/显示状态栏
 */
+ (void)setStatusBarHidden:(BOOL)hidden;

/**
 设置状态栏颜色,需要在info.plist中，将View controller-based status bar appearance设为NO
 */
+ (void)setStatusBarStyle:(LLStatusBarStyle)statusBarStyle;

/**
 判断APP是否第一次启动
 */
+ (BOOL)checkAppIsFirstLaunch;

/**
 判断系统是否允许应用接收推送消息
 */
+ (BOOL)checkRemoteNotificationIsAllowed;

/**
 判断当前设备是否获取麦克风授权
 */
+ (void)checkMicrophoneEnableBlock:(doBlock)enable disableBlock:(doBlock)disable;

/**
 判断当前设备是否获取相册权限
 */
+ (BOOL)checkPhotosEnable;

/**
 判断当前设备是否获取相机权限
 */
+ (BOOL)checkCameraEnable;

/**
 判断当前设备是否获取定位权限
 */
+ (BOOL)checkLocationEnable;

@end
