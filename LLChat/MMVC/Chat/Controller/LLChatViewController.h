//
//  LLChatViewController.h
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LLChatUserModel;

@interface LLChatViewController : UIViewController

- (instancetype)initWithUser:(LLChatUserModel *)userModel;

@end
