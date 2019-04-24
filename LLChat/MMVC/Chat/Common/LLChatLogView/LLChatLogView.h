//
//  LLChatLogView.h
//  lhy_test
//
//  Created by WangZhaomeng on 2018/1/29.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLChatLogTableViewCell.h"

@interface LLChatLogView : UIView

+ (void)startLog;
+ (NSString *)outputString:(NSString *)string;

@end
