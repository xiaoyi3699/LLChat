//
//  LLChatUserTableViewCell.h
//  LLChat
//
//  Created by WangZhaomeng on 2019/4/30.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LLChatUserModel;

@interface LLChatUserTableViewCell : UITableViewCell

- (void)setConfig:(LLChatUserModel *)model;

@end
