//
//  LLPhoto.h
//  LLPhotoBrowser
//
//  Created by zhaomengWang on 17/2/6.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LLPhotoDelegate;

///手势类型
typedef enum : NSInteger {
    LLGestureRecognizerTypeSingle  = 0,
    LLGestureRecognizerTypeDouble,
    LLGestureRecognizerTypeLong,
} LLGestureRecognizerType;

@interface LLPhoto : UIScrollView

///当前显示的图片
@property (nonatomic, strong) id ll_image;

@property (nonatomic, weak)   id<LLPhotoDelegate> ll_delegate;
@end

@protocol LLPhotoDelegate <NSObject>

@optional
- (void)clickAtPhoto:(LLPhoto *)photo content:(id)content isGif:(BOOL)isGif type:(LLGestureRecognizerType)type;

@end
