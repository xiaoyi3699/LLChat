//
//  LLEmojisKeyboard.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/5.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLEmojisKeyboard.h"
#import "LLEmojisCell.h"
#import "LLDeleteCell.h"
#import "LLHorizontalLayout.h"
#import "LLChatMacro.h"
#import "UIView+LLChat.h"

#define key_rows  3
#define key_nums  7
#define key_itemW 40
@interface LLEmojisKeyboard ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation LLEmojisKeyboard {
    NSMutableArray *_peopleEmojis;
    UICollectionView *_collectionView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat spcing = (frame.size.width-key_itemW*key_nums)/(key_nums+1);
        LLHorizontalLayout *horLayout = [[LLHorizontalLayout alloc] initWithSpacing:spcing rows:key_rows nums:key_nums];
        
        CGRect rect = self.bounds;
        rect.size.height -= (40+LLCHAT_BOTTOM_H);
        _collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:horLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 110000
        if (@available(iOS 11.0, *)) {
            _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
#endif
        _collectionView.pagingEnabled = YES;
        [_collectionView registerClass:[LLEmojisCell class] forCellWithReuseIdentifier:@"emojisCell"];
        [_collectionView registerClass:[LLDeleteCell class] forCellWithReuseIdentifier:@"deleteCell"];
        [self addSubview:_collectionView];
        
        UIView *toolView = [[UIView alloc] initWithFrame:CGRectMake(0, _collectionView.maxY, frame.size.width, 40)];
        toolView.backgroundColor = [UIColor colorWithRed:250/255. green:250/255. blue:250/255. alpha:1];
        [self addSubview:toolView];
        
        UIButton *sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sendBtn.frame = CGRectMake(frame.size.width-80, 0, 80, 40);
        sendBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        sendBtn.backgroundColor = [UIColor colorWithRed:34/255. green:207/255. blue:172/255. alpha:1];
        [sendBtn setTitle:@"发送" forState:UIControlStateNormal];
        [sendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [sendBtn addTarget:self action:@selector(sendBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [toolView addSubview:sendBtn];
        
        NSInteger count = key_rows*key_nums;
        _peopleEmojis = [[NSMutableArray alloc] initWithCapacity:0];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"EmojisList" ofType:@"plist"];
        NSDictionary *emojis = [NSDictionary dictionaryWithContentsOfFile:path];
        NSArray *peopleEmojis = [emojis objectForKey:@"People"];
        
        for (NSInteger i = 1; i < peopleEmojis.count; i ++) {
            if (i % count == 0) {
                count += 21;
                [_peopleEmojis addObject:@"-1"];
            }
            else {
                [_peopleEmojis addObject:[peopleEmojis objectAtIndex:i]];
            }
        }
        if (_peopleEmojis.count % 21 > 0) {
            [_peopleEmojis addObject:@"-1"];
        }
        [_collectionView reloadData];
    }
    return self;
}

#define mark - UICollectionViewDataSource,UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _peopleEmojis.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item < _peopleEmojis.count) {
        NSString *text = [_peopleEmojis objectAtIndex:indexPath.item];
        if ([text isEqualToString:@"-1"]) {
            LLDeleteCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"deleteCell" forIndexPath:indexPath];
            return cell;
        }
        else {
            LLEmojisCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"emojisCell" forIndexPath:indexPath];
            [cell setConfig:text];
            return cell;
        }
    }
    return [UICollectionViewCell new];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item < _peopleEmojis.count) {
        NSString *text = [_peopleEmojis objectAtIndex:indexPath.item];
        if ([self.delegate respondsToSelector:@selector(emojisKeyboardSelectedText:)]) {
            [self.delegate emojisKeyboardSelectedText:text];
        }
    }
}

- (void)sendBtnClick:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(emojisKeyboardSendMessage)]) {
        [self.delegate emojisKeyboardSendMessage];
    }
}

@end
