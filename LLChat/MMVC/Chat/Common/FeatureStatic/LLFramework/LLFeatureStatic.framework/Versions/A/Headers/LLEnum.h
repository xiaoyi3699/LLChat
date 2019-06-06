//
//  LLEnum.h
//  LLFoundation
//
//  Created by WangZhaomeng on 2017/7/5.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#ifndef LLEnum_h
#define LLEnum_h

///导航栏颜色
typedef enum : NSInteger {
    LLStatusBarStyleDefault         = 0, //黑色
    LLStatusBarStyleLightContent,        //白色
} LLStatusBarStyle;

///打开AppStore的方式
typedef enum : NSInteger {
    LLAppStoreTypeOpen  = 0,//AppStore
    LLAppStoreTypeInApp,    //应用内
} LLAppStoreType;

///转场动画
typedef enum : NSInteger {
    Fade                = 1,   //淡入淡出
    Push,                      //推挤
    Reveal,                    //揭开
    MoveIn,                    //覆盖
    Cube,                      //立方体
    SuckEffect,                //吮吸
    OglFlip,                   //翻转
    RippleEffect,              //波纹
    PageCurl,                  //翻页
    PageUnCurl,                //反翻页
    CameraIrisHollowOpen,      //开镜头
    CameraIrisHollowClose,     //关镜头
    CurlDown,                  //下翻页
    CurlUp,                    //上翻页
    FlipFromLeft,              //左翻转
    FlipFromRight,             //右翻转
} AnimationType;

///tableHeaderView动画
typedef enum : NSInteger {
    LLAutoHeaderAnimationNon   = -1, //无动画
    LLAutoHeaderAnimationScale = 0,  //按比例缩放
    LLAutoHeaderAnimationFill  = 1,  //拉伸填充
}LLAutoHeaderAnimation;

///弹出框动画
typedef enum : NSInteger {
    LLAnimationStyleOutFromCenterNone = 0,  //从中心，由小到大弹出，无弹性o动画
    LLAnimationStyleOutFromCenterAnimation, //从中心，由小到大弹出，有弹性动画
    LLAnimationStyleFromDownAnimation,      //从底部弹出
    
} LLAnimationStyle;

///阴影样式
typedef enum : NSInteger {
    LLShadowTypeAll,         //四个边阴影
    LLShadowTypeTopLeft,     //两个变阴影(左上角)
    LLShadowTypeTopRight,    //两个变阴影(右上角)
    LLShadowTypeBottomLeft,  //两个变阴影(左下角)
    LLShadowTypeBottomRight  //两个变阴影(右下角)
} LLShadowType;

///屏幕方向
typedef enum : NSInteger {
    LLLaunchImageTypePortrait = 0, //竖屏
    LLLaunchImageTypeLandscape     //横屏
} LLLaunchImageType;

///梯度方向
typedef enum : NSInteger {
    LLGradientTypeLeftToRight = 0,       //从左到右
    LLGradientTypeTopToBottom = 1,       //从上到下
    LLGradientTypeUpleftToLowright = 2,  //左上到右下
    LLGradientTypeUprightToLowleft = 3,  //右上到左下
} LLGradientType;

///摄像头方向
typedef enum : NSInteger {
    LLCaptureDevicePositionUnspecified = 0,
    LLCaptureDevicePositionBack        = 1,
    LLCaptureDevicePositionFront       = 2,
}LLCaptureDevicePosition;

///键盘上方工具栏样式
typedef enum : NSInteger {
    LLInputAccessoryTypeDone,
    LLInputAccessoryTypeCancel,
    LLInputAccessoryTypeAll,
} LLInputAccessoryType;

///输入框MenuItem样式
typedef enum : NSInteger {
    LLPerformActionTypeNormal,
    LLPerformActionTypeNone,
} LLPerformActionType;

///取值方式
typedef enum : NSInteger {
    LLTakingValueStyleMin, //最小值
    LLTakingValueStyleMax, //最大值
    LLTakingValueStyleAvg, //平均值
    LLTakingValueStyleSum, //求和
} LLTakingValueStyle;

///网络状态
typedef enum : NSInteger {
    LLNetWorkStatusUnknown,
    LLNetWorkStatus2G,
    LLNetWorkStatus3G,
    LLNetWorkStatus4G,
    LLNetWorkStatusWifi,
} LLNetWorkStatus;

//
typedef enum : NSInteger {
    LLNetRequestContentTypeForm = 0,//表单
    LLNetRequestContentTypeJson,    //json
}LLNetRequestContentType;

///文件管理
typedef enum : NSInteger {
    LLNotFound          = 404,  //路径未找到
    LLIsNotDirectory            //不是文件夹
}LLFileManagerError;

///应用类型
typedef enum : NSInteger {
    mqq           = 0, //QQ
    weixin,            //微信
    sinaweibo,         //新浪微博
    alipay,            //支付宝
    taobao,            //淘宝
} LLAPPType;

///图片格式
typedef enum : NSInteger {
    LLImageTypeUnknown  = -1,
    LLImageTypePNG      = 0,
    LLImageTypeJPEG,
    LLImageTypeGIF,
    LLImageTypeTIFF,
    LLImageTypeWEBP,
} LLImageType;

///弹框样式
typedef enum : NSInteger {
    LLAlertViewTypeNormal = 0,
    LLAlertViewTypeUpdate,
}LLAlertViewType;

#endif /* LLEnum_h */
