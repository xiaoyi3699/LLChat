//
//  LLChatRecordAnimation.m
//  LLChat
//
//  Created by WangZhaomeng on 2019/5/23.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//

#import "LLChatRecordAnimation.h"

@implementation LLChatRecordAnimation {
    NSArray *_images;
    BOOL _isPause;
}

- (instancetype)init {
    if (self = [super initWithFrame:CGRectMake((SCREEN_WIDTH-120)/2, SCREEN_HEIGHT/2-120, 120, 120)]) {
        self.animationDuration    = 0.2;
        self.animationRepeatCount = 0;
        _images = @[[UIImage imageNamed:@"voice_1"],
                    [UIImage imageNamed:@"voice_2"],
                    [UIImage imageNamed:@"voice_3"],
                    [UIImage imageNamed:@"voice_4"],
                    [UIImage imageNamed:@"voice_5"],
                    [UIImage imageNamed:@"voice_6"]];
    }
    return self;
}

- (void)showVoiceCancel {
    _isPause = YES;
    [self stopAnimating];
    self.image = [UIImage imageNamed:@"voice_cancel"];
}

- (void)showVoiceShort {
    _isPause = YES;
    [self stopAnimating];
    self.image = [UIImage imageNamed:@"voice_short"];
}

- (void)showVoiceAnimation {
    _isPause = NO;
    [self updateImages];
}

- (void)setVolume:(CGFloat)volume {
    if (_volume == volume) {
        if (self.isAnimating) return;
    }
    else {
        _volume = MIN(MAX(volume, 0.f),1.f);
    }
    [self updateImages];
}

- (void)updateImages {
    if (_isPause) return;
    if (_volume == 0) {
        [self stopAnimating];
        self.animationImages = nil;
        return;
    }
    if (_volume >= 0.8 ) {
        self.animationImages = @[_images[4],_images[5]];
    }
    else if (_volume >= 0.6 ) {
        self.animationImages = @[_images[3],_images[4]];
    }
    else if (_volume >= 0.4 ) {
        self.animationImages = @[_images[2],_images[3]];
    }
    else if (_volume >= 0.2) {
        self.animationImages = @[_images[1],_images[2]];
    }
    else {
        self.animationImages = @[_images[0],_images[1]];
    }
    [self startAnimating];
}

- (void)removeFromSuperview {
    self.image = nil;
    [self stopAnimating];
    self.animationImages = nil;
    [super removeFromSuperview];
}

@end
