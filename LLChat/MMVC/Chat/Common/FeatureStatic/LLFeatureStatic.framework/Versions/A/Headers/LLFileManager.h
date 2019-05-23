//
//  LLFileManager.h
//  test
//
//  Created by wangzhaomeng on 16/8/23.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLFileManager : NSObject

/**
 文件是否存在
 */
+ (BOOL)fileExistsAtPath:(NSString *)filePath;

/**
 文件是否存在,是否是文件夹
 */
+ (BOOL)fileExistsAtPath:(NSString *)filePath isDirectory:(BOOL *)result;

/**
 创建文件夹
 */
+ (BOOL)createDirectoryAtPath:(NSString *)path;

/**
 删除文件(文件夹)
 */
+ (BOOL)deleteFileAtPath:(NSString *)filePath error:(NSError **)error;

/**
 删除指定文件夹下的后缀名为“extension”的文件
 */
+ (void)deleteFileInPath:(NSString *)filePath ofExtension:(NSString *)extension completion:(void(^)(NSArray<NSError *> *errors))completion;

/**
 清空文件夹
 */
+ (void)deleteFileInPath:(NSString *)filePath completion:(doBlock)completion;

/**
 获取缓存大小
 */
+ (float)cacheSizeAtPath:(NSString *)cachePath;

/**
 获取指定路径下所有文件名
 */
+ (NSMutableArray *)getFileNamesAtPath:(NSString *)filePath;

/**
  存储到info.plist
 */
+ (BOOL)setObj:(id)obj forKey:(NSString *)key;

/**
 从info.plist中取
 */
+ (id)objForKey:(NSString *)key;

/**
 删除info.plist中数据
 */
+ (BOOL)removeObjForKey:(NSString *)key;

/**
 删除info.plist中所有数据
 */
+ (void)removeAllObj;

/**
 将文件存到沙盒
 */
+ (BOOL)writeFile:(id)file toPath:(NSString *)path;

#pragma mark - widget数据共享
+ (id)widget_ObjForKey:(NSString *)key groupid:(NSString *)groupid;
+ (BOOL)widget_SetObj:(id)obj forKey:(NSString *)key groupid:(NSString *)groupid;
+ (NSString *)widget_ObjForFileName:(NSString *)fileName groupid:(NSString *)groupid;
+ (BOOL)widget_SetObj:(id)obj forFileName:(NSString *)fileName groupid:(NSString *)groupid;
#pragma mark

@end
