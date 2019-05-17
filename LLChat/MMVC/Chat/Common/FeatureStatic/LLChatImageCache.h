//
//  LLChatImageCache.h
//  LLFoundation
//
//  Created by zhaomengWang on 17/3/14.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//  图片存储

#import <UIKit/UIKit.h>

@interface LLChatImageCache : NSObject

+ (instancetype)imageCache;

/**
 获取网络图片(同步)
 */
- (UIImage *)getImageWithUrl:(NSString *)url isUseCatch:(BOOL)isUseCatch;

/**
 获取网络图片(异步)
 */
- (void)getImageWithUrl:(NSString *)url isUseCatch:(BOOL)isUseCatch completion:(void(^)(UIImage *image))completion;

/**
 获取网络数据(同步)
 */
- (NSData *)getDataWithUrl:(NSString *)url isUseCatch:(BOOL)isUseCatch;

/**
 获取网络数据(异步)
 */
- (void)getDataWithUrl:(NSString *)url isUseCatch:(BOOL)isUseCatch completion:(void(^)(NSData *data))completion;

///存图片
- (NSString *)storeImage:(UIImage *)image forKey:(NSString *)key;
///取图片
- (UIImage *)imageForKey:(NSString *)key;

///存数据
- (NSString *)storeData:(NSData *)data forKey:(NSString *)key;
///取数据
- (NSData *)dataForKey:(NSString *)key;

///文件路径
- (NSString *)filePathForKey:(NSString *)key;

/**
 清理内存
 */
- (void)clearMemory;

/**
 清理所有数据
 */
- (void)clearImageCacheCompletion:(void(^)(void))completion;

@end
