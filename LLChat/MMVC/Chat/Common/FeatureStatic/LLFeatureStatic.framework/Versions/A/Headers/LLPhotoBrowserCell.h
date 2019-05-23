//
//  LLPhotoBrowserCell.h
//  LLCommonSDK
//
//  Created by WangZhaomeng on 2017/12/13.
//  Copyright © 2017年 WangZhaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLPhoto.h"
@protocol LLPhotoBrowserCellDelegate;

@interface LLPhotoBrowserCell : UICollectionViewCell

@property (nonatomic, weak) id<LLPhotoBrowserCellDelegate> delegate;

@property (nonatomic, strong) NSIndexPath *indexPath;

- (void)setImage:(id)image;

- (void)scaleIdentity;

@end

@protocol LLPhotoBrowserCellDelegate <NSObject>

@optional
- (void)photoBrowserCell:(LLPhotoBrowserCell *)photoBrowserCell
        clickAtIndexPath:(NSIndexPath *)indexPath
                 content:(id)content
                   isGif:(BOOL)isGif
                    type:(LLGestureRecognizerType)type;

@end
