//
//  LLSegmentedCell.h
//  LLCommonSDK
//
//  Created by WangZhaomeng on 2017/12/15.
//  Copyright © 2017年 WangZhaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLSegmentedCell : UICollectionViewCell

- (void)setConfigWithTitle:(NSString *)title
                titleColor:(UIColor *)titleColor
                 titleFont:(UIFont *)titleFont
                 lineColor:(UIColor *)lineColor;

@end
