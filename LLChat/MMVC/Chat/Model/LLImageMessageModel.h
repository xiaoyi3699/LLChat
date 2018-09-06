//
//  LLImageMessageModel.h
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/3.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLBaseMessageModel.h"

@interface LLImageMessageModel : LLBaseMessageModel

//图片宽高
@property (nonatomic, assign) NSInteger imgW;
@property (nonatomic, assign) NSInteger imgH;

//原图和缩略图地址(本地路径下图片不存在时, 可使用该地址加载网络图片, 并存储到本地)
@property (nonatomic, strong) NSString *original;
@property (nonatomic, strong) NSString *thumbnail;

//原图或缩略图本地路径(发送方发送的图片消息 或 接收方已经加载过图片后, 可使用本地路径)
@property (nonatomic, strong) NSString *originalPath;
@property (nonatomic, strong) NSString *thumbnailPath;

- (void)handleImageSize;
- (NSString *)saveOrImage:(UIImage *)image;
- (NSString *)saveThImage:(UIImage *)image;

@end
