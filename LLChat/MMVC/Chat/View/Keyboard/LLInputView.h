//
//  LLInputView.h
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/5.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>
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
///发送文本消息
- (void)inputView:(LLInputView *)inputView sendMessage:(NSString *)message;
///自定义键盘点击事件
- (void)inputView:(LLInputView *)inputView selectedType:(LLChatMoreType)type;
///输入框frame改变
- (void)inputView:(LLInputView *)inputView willChangeFrameWithDuration:(CGFloat)duration isEditing:(BOOL)isEditing;

@end
