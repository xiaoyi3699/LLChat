//
//  LLInputView.h
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/5.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLChatBtn.h"
#import "LLEmojisKeyboard.h"
#import "LLChatMoreKeyboard.h"

@protocol LLInputViewDelegate;

@interface LLInputView : UIView

@property (nonatomic, weak) id<LLInputViewDelegate> delegate;

- (void)chatBecomeFirstResponder;
- (void)chatResignFirstResponder;

@end

@protocol LLInputViewDelegate <NSObject>

@optional
- (void)inputView:(LLInputView *)inputView sendMessage:(NSString *)message;
- (void)inputView:(LLInputView *)inputView selectedType:(LLChatMoreType)type;

@end
