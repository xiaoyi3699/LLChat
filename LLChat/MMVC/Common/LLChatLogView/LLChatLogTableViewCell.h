//
//  LLChatLogTableViewCell.h
//  LLFeatureStatic
//
//  Created by WangZhaomeng on 2018/9/26.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLChatLogModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LLChatLogTableViewCell : UITableViewCell

- (instancetype)initWithWidth:(CGFloat)width style:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

- (void)setConfig:(LLChatLogModel *)model;

@end

NS_ASSUME_NONNULL_END
