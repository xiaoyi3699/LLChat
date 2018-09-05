//
//  LLInputView.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/5.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLInputView.h"
#import "LLChatBtn.h"
#import "LLEmojisKeyboard.h"

@interface LLInputView ()<UITextViewDelegate>

@property (nonatomic, strong) LLEmojisKeyboard *emojisKeyboard;

@end

@implementation LLInputView {
    LLChatBtn *_voiceBtn;
    LLChatBtn *_emotionBtn;
    LLChatBtn *_moreBtn;
    UITextView *_textView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat w = frame.size.width;
        self.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, w, 0.5)];
        lineView.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
        [self addSubview:lineView];
        
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
    }
    return self;
}

- (void)btnClick:(UIButton *)btn {
    if (btn.tag == 0) {
        //声音按钮
        
    }
    else if (btn.tag == 1) {
        //表情按钮
        if (btn.selected) {
            btn.selected = NO;
            _textView.inputView = nil;
        }
        else {
            btn.selected = YES;
            _textView.inputView = self.emojisKeyboard;
        }
        [_textView reloadInputViews];
        if ([_textView isFirstResponder] == NO) {
            [_textView becomeFirstResponder];
        }
    }
    else {
        //加号按钮
    }
}

- (void)chatResignFirstResponder {
    if ([_textView isFirstResponder]) {
        [_textView resignFirstResponder];
        _voiceBtn.selected = NO;
        _emotionBtn.selected = NO;
        _moreBtn.selected = NO;
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"] ||
        [text isEqualToString:@"\n\n"] ||
        [text isEqualToString:@"\r"] ||
        [text isEqualToString:@"\r\r"]) {
        return NO;
    }
    return YES;
}

#pragma mark - getter
- (LLEmojisKeyboard *)emojisKeyboard {
    if (_emojisKeyboard == nil) {
        _emojisKeyboard = [[LLEmojisKeyboard alloc] init];
    }
    return _emojisKeyboard;
}

@end
