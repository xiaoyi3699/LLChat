//
//  LLInputView.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/5.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLInputView.h"

typedef enum : NSInteger {
    LLInputViewTypeNone = 0,
    LLInputViewTypeKeyboard,
    LLInputViewTypeVoice,
    LLInputViewTypeemotion,
    LLInputViewTypeMore,
}LLInputType;
@interface LLInputView ()<UITextViewDelegate,LLEmojisKeyboardDelegate,LLChatMoreKeyboardDelegate>

@property (nonatomic, strong) LLChatMoreKeyboard *moreKeyboard;
@property (nonatomic, strong) LLEmojisKeyboard *emojisKeyboard;
@property (nonatomic, assign) LLInputType type;

@end

@implementation LLInputView {
    LLChatBtn *_voiceBtn;
    LLChatBtn *_emotionBtn;
    LLChatBtn *_moreBtn;
    UITextView *_textView;
    BOOL _isEditing;
}

- (instancetype)init {
    self = [super initWithFrame:CGRectMake(0, LLCHAT_SCREEN_HEIGHT-LLCHAT_INPUT_H, LLCHAT_SCREEN_WIDTH, LLCHAT_INPUT_H+LLCHAT_KEYBOARD_H)];
    if (self) {
        
        self.type = LLInputViewTypeNone;
        
        CGFloat w = self.LLWidth;
        self.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, w, 0.5)];
        lineView.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
        [self addSubview:lineView];
        
        NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:3];
        NSArray *images = @[@"ll_chat_voice",@"ll_chat_emotion",@"ll_chat_more"];//ll_chat_board
        UIImage *keyboardImg = [UIImage imageNamed:@"ll_chat_board"];
        for (NSInteger i = 0; i < 3; i ++) {
            LLChatBtn *btn = [LLChatBtn chatButtonWithType:LLChatButtonTypeInput];
            
            if (i == 0) {
                btn.frame = CGRectMake(0, 4.5, 40, 40);
                _voiceBtn = btn;
            }
            else if (i == 1) {
                btn.frame = CGRectMake(w-80, 4.5, 40, 40);
                _emotionBtn = btn;
            }
            else {
                btn.frame = CGRectMake(w-40, 4.5, 40, 40);
                _moreBtn = btn;
            }
            
            btn.tag = i;
            [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
            [btn setImage:keyboardImg forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            
            [array addObject:btn];
        }
        
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(40, 7, w-120, 35)];
        _textView.font = [UIFont systemFontOfSize:13];
        _textView.textColor = [UIColor darkTextColor];
        _textView.layer.masksToBounds = YES;
        _textView.layer.cornerRadius = 2;
        _textView.layer.borderWidth = 0.5;
        _textView.returnKeyType = UIReturnKeySend;
        _textView.delegate = self;
        _textView.layer.borderColor = [UIColor colorWithRed:200/255. green:200/255. blue:200/255. alpha:1].CGColor;
        [self addSubview:_textView];
        
        [self addSubview:self.moreKeyboard];
        [self addSubview:self.emojisKeyboard];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardValueChange:)
                                                     name:UIKeyboardWillChangeFrameNotification
                                                   object:nil];
    }
    return self;
}

#pragma mark - 监听键盘变化
- (void)keyboardValueChange:(NSNotification *)notification {
    if (_textView.isFirstResponder == NO) return;
    NSDictionary *dic = notification.userInfo;
    CGFloat duration = [dic[@"UIKeyboardAnimationDurationUserInfoKey"] floatValue];
    CGRect endFrame = [dic[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    
    if (endFrame.origin.y == LLCHAT_SCREEN_HEIGHT) {
        //键盘收回
        if (_isEditing) {
            //弹出自定义键盘
            CGFloat minY = LLCHAT_SCREEN_HEIGHT-self.LLHeight;
            [self minYWillChange:minY duration:duration isFinishEditing:NO];
        }
//        else {
//            //结束编辑
//            CGFloat minY = LLCHAT_SCREEN_HEIGHT-LLCHAT_INPUT_H;
//            [self minYWillChange:minY duration:duration isFinishEditing:YES];
//        }
    }
    else {
        //键盘谈起
        CGFloat minY = endFrame.origin.y-LLCHAT_INPUT_H;
        [self minYWillChange:minY duration:duration isFinishEditing:NO];
    }
}

- (void)minYWillChange:(CGFloat)minY duration:(CGFloat)duration isFinishEditing:(BOOL)isFinishEditing {
    _isEditing = !isFinishEditing;
    if (isFinishEditing) {
        [self recoverSetting:_voiceBtn.selected];
    }
    else {
        if (_moreBtn.selected) {
            //点击了更多按钮
            self.emojisKeyboard.hidden = YES;
            self.moreKeyboard.hidden = NO;
        }
        else if (_emotionBtn.selected) {
            //点击了表情按钮
            self.emojisKeyboard.hidden = NO;
            self.moreKeyboard.hidden = YES;
        }
    }
    CGRect endFrame = self.frame;
    endFrame.origin.y = minY;
    [UIView animateWithDuration:duration animations:^{
        self.frame = endFrame;
    }];
    if ([self.delegate respondsToSelector:@selector(inputView:frameWillChangeWithDuration:isEditing:)]) {
        [self.delegate inputView:self frameWillChangeWithDuration:duration isEditing:_isEditing];
    }
}

#pragma mark - 用户交互事件
- (void)btnClick:(UIButton *)btn {
    
    if (btn.isSelected) {
        [self chatBecomeFirstResponder];
    }
    else {
        btn.selected = YES;
        if (btn.tag == 0) {
            //声音按钮
            _moreBtn.selected = NO;
            _emotionBtn.selected = NO;
            if (_isEditing) {
                _isEditing = NO;
                if (_textView.isFirstResponder) {
                    [_textView resignFirstResponder];
                }
                else {
                    //结束编辑
                    CGFloat duration = 0.3;
                    CGFloat minY = LLCHAT_SCREEN_HEIGHT-LLCHAT_INPUT_H;
                    [self minYWillChange:minY duration:duration isFinishEditing:YES];
                }
            }
        }
        else {
            if (btn.tag == 1) {
                //表情按钮
                _voiceBtn.selected = NO;
                _moreBtn.selected = NO;
            }
            else {
                //加号按钮
                _voiceBtn.selected = NO;
                _emotionBtn.selected = NO;
            }
            
            if (_textView.isFirstResponder) {
                [_textView resignFirstResponder];
            }
            else {
                //弹出自定义键盘
                CGFloat duration = 0.3;
                CGFloat minY = LLCHAT_SCREEN_HEIGHT-self.LLHeight;
                [self minYWillChange:minY duration:duration isFinishEditing:NO];
            }
        }
    }
}

#pragma mark - public method
- (void)chatBecomeFirstResponder {
    if (_isEditing == NO) {
        _isEditing = YES;
        [_textView becomeFirstResponder];
    }
}

- (void)chatResignFirstResponder {
    if (_isEditing) {
        _isEditing = NO;
        //结束编辑
        CGFloat duration = 0.3;
        CGFloat minY = LLCHAT_SCREEN_HEIGHT-LLCHAT_INPUT_H;
        [self minYWillChange:minY duration:duration isFinishEditing:YES];
        [_textView resignFirstResponder];
    }
}

#pragma mark - private method
- (void)sendMessage {
    if (_textView.text.length > 0) {
        if ([self.delegate respondsToSelector:@selector(inputView:sendMessage:)]) {
            [self.delegate inputView:self sendMessage:_textView.text];
        }
        _textView.text = @"";
    }
}

//还原按钮状态
- (void)recoverSetting:(BOOL)isClickVoice {
    if (!isClickVoice) {
        _voiceBtn.selected = NO;
    }
    
    _emotionBtn.selected = NO;
    _moreBtn.selected = NO;
    
    self.emojisKeyboard.hidden = YES;
    self.moreKeyboard.hidden = YES;
}

#pragma mark - delegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"] ||
        [text isEqualToString:@"\n\n"] ||
        [text isEqualToString:@"\r"] ||
        [text isEqualToString:@"\r\r"]) {
        
        [self sendMessage];
        return NO;
    }
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    [self recoverSetting:NO];
}

- (void)emojisKeyboardSelectedText:(NSString *)text {
    if ([text isEqualToString:@"-1"]) {
        if (_textView.text.length > 0) {
            [_textView deleteBackward];
        }
    }
    else {
        if (_textView.text.length == 0) {
            _textView.text = text;
        }
        else {
            _textView.text = [NSString stringWithFormat:@"%@%@",_textView.text,text];
        }
    }
}

- (void)moreKeyboardSelectedType:(LLChatMoreType)type {
    if ([self.delegate respondsToSelector:@selector(inputView:selectedType:)]) {
        [self.delegate inputView:self selectedType:type];
    }
}

- (void)emojisKeyboardSendMessage {
    [self sendMessage];
}

#pragma mark - getter
- (LLEmojisKeyboard *)emojisKeyboard {
    if (_emojisKeyboard == nil) {
        _emojisKeyboard = [[LLEmojisKeyboard alloc] initWithFrame:CGRectMake(0, LLCHAT_INPUT_H, LLCHAT_SCREEN_WIDTH, LLCHAT_KEYBOARD_H)];
        _emojisKeyboard.delegate = self;
        _emojisKeyboard.hidden = YES;
    }
    return _emojisKeyboard;
}

- (LLChatMoreKeyboard *)moreKeyboard {
    if (_moreKeyboard == nil) {
        _moreKeyboard = [[LLChatMoreKeyboard alloc] initWithFrame:CGRectMake(0, LLCHAT_INPUT_H, LLCHAT_SCREEN_WIDTH, LLCHAT_KEYBOARD_H)];
        _moreKeyboard.delegate = self;
        _moreKeyboard.hidden = YES;
    }
    return _moreKeyboard;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
