//
//  LLBaseMessageTableViewCell.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLBaseMessageTableViewCell.h"
#import "LLChatBtn.h"

@implementation LLBaseMessageTableViewCell {
    LLChatBtn *_retryBtn;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.layer.cornerRadius = 20;
        [self addSubview:_avatarImageView];
        
        _nickLabel = [[UILabel alloc] init];
        _nickLabel.textColor = [UIColor grayColor];
        _nickLabel.textAlignment = NSTextAlignmentCenter;
        _nickLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:_nickLabel];
        
        _bubbleImageView = [[UIImageView alloc] init];
        [self addSubview:_bubbleImageView];
        
        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:_activityView];
        
        _retryBtn = [LLChatBtn chatButtonWithType:LLChatButtonTypeRetry];
        [_retryBtn setImage:[UIImage imageNamed:@"ll_chat_retry"] forState:UIControlStateNormal];
        [_retryBtn addTarget:self action:@selector(retryBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_retryBtn];
    }
    return self;
}

- (void)setConfig:(LLBaseMessageModel *)model {
    
    if (model.isSender) {
        //头像
        _avatarImageView.frame = CGRectMake(LL_SCREEN_WIDTH-60, 10, 40, 40);
        //可改成网络图片
        _avatarImageView.image = [UIImage imageNamed:@"ll_from_avatar"];
        
        //昵称
        _nickLabel.frame = CGRectMake(_avatarImageView.minX-110, 10, 100, 20);
        _nickLabel.text = model.fromNick;
        _nickLabel.textAlignment = NSTextAlignmentRight;
        
        //聊天气泡
        _bubbleImageView.frame = CGRectMake(_avatarImageView.minX-model.modelW-17, _nickLabel.maxY+5, model.modelW+17, model.modelH+10);
        _bubbleImageView.image = [[LLChatHelper shareInstance] senderBubbleImage];
        
        //消息内容
        CGRect rect = _bubbleImageView.frame;
        rect.origin.x += 5;
        rect.origin.y += 5;
        rect.size.width -= 17;
        rect.size.height -= 10;
        _contentRect = rect;
        
        //正在发送菊花动画
        _activityView.frame = CGRectMake(_bubbleImageView.minX-40, _bubbleImageView.minY+(_bubbleImageView.LLHeight-40)/2, 40, 40);
        
        if (model.sendType == LLMessageSendTypeWaiting) {
            _activityView.hidden = NO;
            [_activityView startAnimating];
            
            _retryBtn.hidden = YES;
        }
        else if (model.sendType == LLMessageSendTypeSuccess) {
            _activityView.hidden = YES;
            [_activityView stopAnimating];
            
            _retryBtn.hidden = YES;
        }
        else {
            _activityView.hidden = YES;
            [_activityView stopAnimating];
            
            _retryBtn.hidden = NO;
        }
        
        //发送失败感叹号
        _retryBtn.frame = CGRectMake(_activityView.minX, _bubbleImageView.maxY-30, 40, 40);
    }
    else {
        _avatarImageView.frame = CGRectMake(20, 10, 40, 40);
        //可改成网络图片
        _avatarImageView.image = [UIImage imageNamed:@"ll_to_avatar"];
        
        _nickLabel.frame = CGRectMake(_avatarImageView.maxX+10, 10, 100, 20);
        _nickLabel.text = model.fromNick;
        _nickLabel.textAlignment = NSTextAlignmentLeft;
        
        _bubbleImageView.frame = CGRectMake(_avatarImageView.maxX, _nickLabel.maxY+5, model.modelW+17, model.modelH+10);
        _bubbleImageView.image = [[LLChatHelper shareInstance] receiverBubbleImage];
        
        CGRect rect = _bubbleImageView.frame;
        rect.origin.x += 12;
        rect.origin.y += 5;
        rect.size.width -= 17;
        rect.size.height -= 10;
        _contentRect = rect;
        
        _activityView.hidden = YES;
        [_activityView stopAnimating];
        _activityView.frame = CGRectMake(_bubbleImageView.maxX, _bubbleImageView.minY+(_bubbleImageView.LLHeight-40)/2, 40, 40);
        
        _retryBtn.hidden = YES;
        _retryBtn.frame = CGRectMake(_activityView.minX, _bubbleImageView.maxY-30, 40, 40);
    }
}

- (void)retryBtnClick:(UIButton *)btn {
    
}

@end
