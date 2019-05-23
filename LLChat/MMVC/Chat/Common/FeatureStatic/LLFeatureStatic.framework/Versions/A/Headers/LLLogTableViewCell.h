//
//  LLLogTableViewCell.h
//  LLFeatureStatic
//
//  Created by WangZhaomeng on 2018/9/26.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLLogModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LLLogTableViewCell : UITableViewCell

- (instancetype)initWithWidth:(CGFloat)width style:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

- (void)setConfig:(LLLogModel *)model;

@end

NS_ASSUME_NONNULL_END
