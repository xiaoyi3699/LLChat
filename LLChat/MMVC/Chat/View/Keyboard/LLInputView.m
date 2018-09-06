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
@interface LLInputView ()<UITextViewDelegate,LLEmojisKeyboardDelegate,LLMoreKeyboardDelegate>

@property (nonatomic, strong) LLMoreKeyboard *moreKeyboard;
@property (nonatomic, strong) LLEmojisKeyboard *emojisKeyboard;
@property (nonatomic, assign) LLInputType type;

@end

@implementation LLInputView {
    LLChatBtn *_voiceBtn;
    LLChatBtn *_emotionBtn;
    LLChatBtn *_moreBtn;
    NSArray *_inputBtns;
    UITextView *_textView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.type = LLInputViewTypeNone;
        
        CGFloat w = frame.size.width;
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
        _inputBtns = [array copy];
        
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
    }
    return self;
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
            _textView.inputView = nil;
            [_textView resignFirstResponder];
            [_textView reloadInputViews];
        }
        else if (btn.tag == 1) {
            //表情按钮
            _voiceBtn.selected = NO;
            _moreBtn.selected = NO;
            _textView.inputView = self.emojisKeyboard;
            [_textView reloadInputViews];
            [_textView becomeFirstResponder];
        }
        else {
            //加号按钮
            _voiceBtn.selected = NO;
            _emotionBtn.selected = NO;
            _textView.inputView = self.moreKeyboard;
            [_textView reloadInputViews];
            [_textView becomeFirstResponder];
        }
    }
}

#pragma mark - public method
- (void)chatBecomeFirstResponder {
    _voiceBtn.selected = NO;
    _emotionBtn.selected = NO;
    _moreBtn.selected = NO;
    _textView.inputView = nil;
    [_textView reloadInputViews];
    [_textView becomeFirstResponder];
}

- (void)chatResignFirstResponder {
    [_textView resignFirstResponder];
    _voiceBtn.selected = NO;
    _emotionBtn.selected = NO;
    _moreBtn.selected = NO;
    _textView.inputView = nil;
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
    _voiceBtn.selected = NO;
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

- (void)moreKeyboardSelectedType:(LLMoreType)type {
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
        _emojisKeyboard = [[LLEmojisKeyboard alloc] init];
        _emojisKeyboard.delegate = self;
    }
    return _emojisKeyboard;
}

- (LLMoreKeyboard *)moreKeyboard {
    if (_moreKeyboard == nil) {
        _moreKeyboard = [[LLMoreKeyboard alloc] init];
        _moreKeyboard.delegate = self;
    }
    return _moreKeyboard;
}

@end
