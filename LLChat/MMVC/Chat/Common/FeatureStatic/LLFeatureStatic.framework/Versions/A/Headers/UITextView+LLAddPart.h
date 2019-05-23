//
//  UITextView+LLAddPart.h
//  LLFoundation
//
//  Created by WangZhaomeng on 2017/7/5.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (LLAddPart)

- (void)setPerformActionType:(LLPerformActionType)performActionType;
- (LLPerformActionType)performActionType;

- (BOOL)ll_shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text limitNums:(NSInteger)limitNums;
- (BOOL)ll_shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text pointNums:(NSInteger)pointNums;
- (void)ll_limitTextFieldLength:(NSInteger)length;
- (void)ll_selectAllText;
- (void)ll_setSelectedRange:(NSRange)range;

///工具框样式
- (void)ll_inputAccessoryViewWithType:(LLInputAccessoryType)type message:(NSString *)message;

///添加完成按钮
- (void)ll_inputAccessoryViewWithDoneTitle:(NSString *)title message:(NSString *)message;

@end
