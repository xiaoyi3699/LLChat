//
//  UIImage+AddPart.h
//  Money
//
//  Created by fan on 16/7/15.
//  Copyright © 2016年 liupeidong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LLAddPart)

#pragma mark - 类方法
/**
 根据颜色创建image
 */
+ (UIImage *)ll_imageWithColor:(UIColor*) color;

/**
 根据颜色创建image<圆形>
 */
+ (UIImage *)ll_roundImageWithColor:(UIColor*)color size:(CGSize)size;

/**
 根据颜色创建image<矩形>
 */
+ (UIImage *)ll_rectImageWithColor:(UIColor*)color size:(CGSize)size;

/**
 截屏
 */
+ (UIImage*)ll_screenImageFromView:(UIView *)view;

/**
 根据ALAsset/PHAsset获取image
 */
+ (void)ll_originalPhotoWithAsset:(id)asset completion:(void (^)(UIImage *photo,NSDictionary *info))completion;

/**
 根据ALAsset中的URL获取image
 */
+ (UIImage *)ll_imageFromURL:(NSURL *)url;

/**
 base64编码转换为图片
 */
+ (UIImage *)ll_imageFromBase64Str:(NSString *)base64String;

/**
 创建一个动态图片，动态图片持续的时间为duration
 */
+ (UIImage *)ll_animatedImageWithImages:(NSArray *)imageNames duration:(NSTimeInterval)duration;

/**
 从网址中获取图片
 */
+ (UIImage *)ll_imageURLString:(NSString *)URLString;

/**
 保存图片到自定义相册
 */
+ (void)ll_saveToAlbumName:(NSString *)albumName data:(NSData *)data completion:(doBlock)completion;

/**
 合并图片
 */
+ (UIImage *)ll_mergeImage:(UIImage*)firstImage otherImage:(UIImage*)secondImage;

/**
 获取launchImage
 */
+ (UIImage *)ll_launchImageType:(LLLaunchImageType)type;

/**
 梯度图
 */
+ (UIImage *)ll_gradientImageWithColors:(NSArray *)colors gradientType:(LLGradientType)gradientType imgSize:(CGSize)imgSize;

/**
 生成二维码图片
 */
+ (UIImage *)ll_qrImageFromString:(NSString *)string size:(CGFloat)size;

/**
 绘制空心图片
 */
+ (UIImage *)ll_imageWithShadowFrame:(CGRect)shadowFrame hollowFrame:(CGRect)hollowFrame shadowColor:(UIColor *)shadowColor;

#pragma mark - 实例方法
/**
 保存到相册
 */
- (void)ll_savedToPhotosAlbum;

- (UIImage *)ll_clipImageWithRect:(CGRect)rect;

/**
 二维码图片添加logo
 */
- (UIImage *)ll_addLogo:(UIImage *)logo logoSize:(CGFloat)logoSize;

/**
 改变二维码图片的颜色
 */
- (UIImage *)ll_imageWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

/**
 压缩图片所占的物理内存大小 100M以内的图片经过三层压缩，<= 1M
 */
- (UIImage *)ll_scaleImage;

/**
 按比例压缩image
 */
- (UIImage *)ll_imageWithScale:(float)scale;

/**
 圆角图片
 */
- (UIImage *)ll_roundImageSize:(CGSize)size radius:(CGFloat)radius;

/**
 图片上绘制文字 写一个UIImage的category
 */
- (UIImage *)ll_imageWithTitle:(NSString *)title fontSize:(CGFloat)fontSize;

/**
 拉伸图片
 */
- (UIImage *)ll_resizableImageWithName:(NSString *)imageName;

/**
 聊天对话框拉伸
 */
- (UIImage *)ll_stretchableImageWithLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight;

/**
 取图片某一像素的颜色
 */
- (UIColor *)ll_colorAtPixel:(CGPoint)point;

/**
 模糊图片
 */
- (UIImage *)ll_blurImageWithScale:(CGFloat)scale;

/**
 按比例生成缩略图
 */
- (UIImage *)ll_thumbnailWithSize:(CGSize)asize;

/**
 判断该图片是否有Alpha通道
 */
- (BOOL)ll_hasAlphaChannel;

/**
 灰度图
 */
- (UIImage *)ll_grayImage;

///按给定的方向旋转图片
- (UIImage*)ll_rotate:(UIImageOrientation)orient;
///垂直翻转
- (UIImage *)ll_flipVertical;
///水平翻转
- (UIImage *)ll_flipHorizontal;

@end
