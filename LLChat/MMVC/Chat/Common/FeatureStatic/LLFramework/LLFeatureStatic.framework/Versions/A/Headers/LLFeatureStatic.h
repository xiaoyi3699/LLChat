//
//  LLFeatureStatic.h
//  LLFeatureStatic
//
//  Created by WangZhaomeng on 2018/1/9.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for LLFeatureStatic.
FOUNDATION_EXPORT double LLFeatureStaticVersionNumber;

//! Project version string for LLFeatureStatic.
FOUNDATION_EXPORT const unsigned char LLFeatureStaticVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <LLFeatureStatic/PublicHeader.h>

//MARK:  注释
//TODO:  注释
//FIXME: 注释
//!!!!:  注释
//???:   注释

/*  *****系统相关*****  */
#import <LLFeatureStatic/LLPublic.h>
#define IS_iPad   [[LLPublic Public] iPad]
#define IS_iPhone [[LLPublic Public] iPhone]
#define CURRENT_LANGUAGE ([[NSLocale preferredLanguages] objectAtIndex:0])

#define WINDOW          [UIApplication sharedApplication].delegate.window
#define SCREEN_BOUNDS   [[LLPublic Public] screenBounds]
#define SCREEN_SCALE    [[LLPublic Public] screenScale]
#define SCREEN_WIDTH    [[LLPublic Public] screenW]
#define SCREEN_HEIGHT   [[LLPublic Public] screenH]
#define STATUS_HEIGHT   [[LLPublic Public] statusH]
#define NAVBAR_HEIGHT   [[LLPublic Public] navBarH]
#define TABBAR_HEIGHT   [[LLPublic Public] tabBarH]
#define BOTTOM_HEIGHT   [[LLPublic Public] iPhoneXBottomH]

//iOS系统版本
#define LL_DEVICE     [[LLPublic Public] systemV]

//APP名字
#define LLAppName     [[LLPublic Public] appName]

//APP Build
#define LLAppBuild    [[LLPublic Public] buildV]

//APP版本
#define LLAppVersion  [[LLPublic Public] shortV]

//获取沙盒Document路径
#define APP_DocumentPath [[LLPublic Public] document]

//获取沙盒temp路径
#define APP_TempPath [[LLPublic Public] temp]

//获取沙盒Cache路径
#define APP_CachePath [[LLPublic Public] cache]

#define IS_IOS11_ABOVE    (LL_DEVICE >= 12) //是否是iOS12以上系统
#define IS_IOS12_ABOVE    (LL_DEVICE >= 11) //是否是iOS11以上系统
#define IS_IOS10_ABOVE    (LL_DEVICE >= 10) //是否是iOS10以上系统
#define IS_IOS9_ABOVE     (LL_DEVICE >= 9)  //是否是iOS9以上系统
#define IS_IOS8_ABOVE     (LL_DEVICE >= 8)  //是否是iOS8以上系统

#define IS_IOS12_ONLY     (LL_DEVICE >= 12 && LL_DEVICE < 13) //是否是iOS12系统
#define IS_IOS11_ONLY     (LL_DEVICE >= 11 && LL_DEVICE < 12) //是否是iOS11系统
#define IS_IOS10_ONLY     (LL_DEVICE >= 10 && LL_DEVICE < 11) //是否是iOS10系统
#define IS_IOS8_AND_IOS9  (LL_DEVICE >= 8 && LL_DEVICE < 10)  //是否是iOS8和iOS9
#define IS_IOS9_ONLY      (LL_DEVICE >= 9 && LL_DEVICE < 10)  //是否是iOS9系统
#define IS_IOS8_ONLY      (LL_DEVICE >= 8 && LL_DEVICE < 9)   //是否是iOS8系统

#define IS_iPhone_4_0 (IS_iPhone && SCREEN_HEIGHT==568)  //4.0寸
#define IS_iPhone_4_7 (IS_iPhone && SCREEN_HEIGHT==667)  //4.7寸
#define IS_iPhone_5_5 (IS_iPhone && SCREEN_HEIGHT==736)  //5.5寸
#define IS_iPhoneX    (IS_iPhone && SCREEN_HEIGHT>=812)  //iPhoneX系列
#define IS_iPhone_5_8 (IS_iPhone && SCREEN_HEIGHT==812)  //5.8寸
#define IS_iPhone_6_1 (IS_iPhone && SCREEN_HEIGHT==896 && SCREEN_SCALE==2.0)  //6.1寸
#define IS_iPhone_6_5 (IS_iPhone && SCREEN_HEIGHT==896 && SCREEN_SCALE==3.0)  //6.5寸

/*  *****自定义*****  */
#define R_G_B(_r_,_g_,_b_) [UIColor colorWithRed:_r_/255. green:_g_/255. blue:_b_/255. alpha:1.0]
#define R_G_B_A(_r_,_g_,_b_,_a_) [UIColor colorWithRed:_r_/255. green:_g_/255. blue:_b_/255. alpha:_a_]

#define COLOR_VALUE(_value_) [UIColor ll_colorWithHex:_value_]
#define COLOR_VALUE_A(_value_,_a_) [UIColor ll_colorWithHex:_value_ alpha:_a_]

#define ANGLE_TO_RADIAN(_x_)       (M_PI*_x_/180.0)       //由角度获取弧度
#define RADIAN_TO_ANGLE(_radian_)  (_radian_*180.0/M_PI)  //由弧度获取角度

//程序的本地化,引用国际化的文件
#define MyLocal(_x_) NSLocalizedString(_x_, nil)

//自定义弹出框的默认蒙版颜色
#define CUSTOM_ALERT_BG_COLOR R_G_B_A(20,20,20,.5)

//弱引用
#define LL_WEAK_SELF    __weak typeof(self) weakself = self
#define LL_STRONG_SELF  __strong typeof(weakself) strongself = weakself

//全局类
#import <LLFeatureStatic/LLLog.h>
#import <LLFeatureStatic/LLBlock.h>
#import <LLFeatureStatic/LLEnum.h>
#import <LLFeatureStatic/LLTextInfo.h>

//第三方
#import <LLFeatureStatic/LLBase64.h>

//扩展类
#import <LLFeatureStatic/NSObject+LLAddPart.h>
#import <LLFeatureStatic/NSDateFormatter+LLAddPart.h>
#import <LLFeatureStatic/NSString+AddPart.h>
#import <LLFeatureStatic/NSAttributedString+AddPart.h>
#import <LLFeatureStatic/NSDate+LLAddPart.h>
#import <LLFeatureStatic/NSData+LLAddData.h>
#import <LLFeatureStatic/NSArray+LLAddPart.h>
#import <LLFeatureStatic/NSDictionary+LLAddPart.h>

//UIAddPart
#import <LLFeatureStatic/UIImage+LLAddPart.h>
#import <LLFeatureStatic/UIView+LLAddPart.h>
#import <LLFeatureStatic/UIColor+LLAddPart.h>
#import <LLFeatureStatic/UITableView+LLAddPart.h>
#import <LLFeatureStatic/UIImageView+LLAddPart.h>
#import <LLFeatureStatic/UIFont+LLAddPart.h>
#import <LLFeatureStatic/UILabel+LLAddPart.h>
#import <LLFeatureStatic/UITextView+LLAddPart.h>
#import <LLFeatureStatic/UITextField+LLAddPart.h>
#import <LLFeatureStatic/UIViewController+LLAddPart.h>
#import <LLFeatureStatic/UIButton+LLAddPart.h>
#import <LLFeatureStatic/UIWebView+LLAddPart.h>
#import <LLFeatureStatic/UIScrollView+LLAddPart.h>
#import <LLFeatureStatic/UINavigationBar+LLAddPart.h>
#import <LLFeatureStatic/UIWindow+LLAddPart.h>

#import <LLFeatureStatic/LLNSHandle.h>
#import <LLFeatureStatic/LLViewHandle.h>

//视图类
#import <LLFeatureStatic/LLAlertView.h>
#import <LLFeatureStatic/LLCycleView.h>
#import <LLFeatureStatic/LLAutoHeader.h>
#import <LLFeatureStatic/LLActionSheet.h>
#import <LLFeatureStatic/LLGifImageView.h>
#import <LLFeatureStatic/LLPhotoBrowser.h>
#import <LLFeatureStatic/LLPopupAnimator.h>
#import <LLFeatureStatic/LLSegmentedView.h>
#import <LLFeatureStatic/LLScrollImageView.h>
#import <LLFeatureStatic/LLAnimationNumView.h>

//工具类
#import <LLFeatureStatic/LLCamera.h>
#import <LLFeatureStatic/LLAppJump.h>
#import <LLFeatureStatic/LLRefresh.h>
#import <LLFeatureStatic/LLDispatch.h>
#import <LLFeatureStatic/LLKeychain.h>
#import <LLFeatureStatic/LLLogView.h>
#import <LLFeatureStatic/LLLogModel.h>
#import <LLFeatureStatic/LLSendEmail.h>
#import <LLFeatureStatic/LLAVManager.h>
#import <LLFeatureStatic/LLDeviceUtil.h>
#import <LLFeatureStatic/LLCatchStore.h>
#import <LLFeatureStatic/LLImageCache.h>
#import <LLFeatureStatic/LLNetWorking.h>
#import <LLFeatureStatic/LLAudioPlayer.h>
#import <LLFeatureStatic/LLFileManager.h>
#import <LLFeatureStatic/LLProgressHUD.h>
#import <LLFeatureStatic/LLSelectedView.h>
#import <LLFeatureStatic/LLSqliteManager.h>
#import <LLFeatureStatic/LLJSONParseUtil.h>
#import <LLFeatureStatic/LLAppStoreScore.h>
#import <LLFeatureStatic/LLLocationManager.h>
#import <LLFeatureStatic/LLNetworkDownload.h>
#import <LLFeatureStatic/LLSignalException.h>
#import <LLFeatureStatic/LLLogTableViewCell.h>
#import <LLFeatureStatic/LLUncaughtException.h>
#import <LLFeatureStatic/LLVideoPlayerViewController.h>

//时间差 CFAbsoluteTime
#define LLStartTime CFAbsoluteTimeGetCurrent()
#define LLEndTime   (CFAbsoluteTimeGetCurrent() - LLStartTime)

//当前时间
#define LL_TIME [[NSDateFormatter ll_defaultDateFormatter] stringFromDate:[NSDate date]]

//日志打印
#ifdef DEBUG
#define __LLFILE__ [[NSString stringWithFormat:@"%s",__FILE__] lastPathComponent]
#define __LLTIME__ [[LL_TIME componentsSeparatedByString:@" "] lastObject]
#define MyLog(format, ...) printf("[%s][%s]: %s\n\n", [__LLFILE__ UTF8String], [__LLTIME__ UTF8String], [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String])

#define NSLog(format, ...) printf("%s\n\n",[[LLLogView outputString:[NSString stringWithFormat:@"时间：%@\n文件：%@\n行数：第%d行\n方法：%@\n输出：%@",LL_TIME,[[NSString stringWithUTF8String:__FILE__] lastPathComponent],__LINE__,[NSString stringWithUTF8String:__FUNCTION__],[NSString stringWithFormat:format, ## __VA_ARGS__]]] UTF8String])
#else
#define MyLog(format, ...)
#define NSLog(format, ...)

#endif
