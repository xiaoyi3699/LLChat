//
//  LLChatViewController.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLChatViewController.h"
#import "LLTextMessageTableViewCell.h"
#import "LLImageMessageTableViewCell.h"

@interface LLChatViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *inputView;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIButton *sendBtn;
@property (nonatomic, strong) NSMutableArray *messageModels;

@end

@implementation LLChatViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"消息";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardValueChange:)
                                                 name:UIKeyboardWillChangeFrameNotification
                                               object:nil];
}

- (void)setupUI {
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.inputView];
    [self.inputView addSubview:self.textView];
    [self.inputView addSubview:self.sendBtn];
}

//监听键盘的frame
- (void)keyboardValueChange:(NSNotification *)notification{
    NSDictionary *dic = notification.userInfo;
    CGFloat duration = [dic[@"UIKeyboardAnimationDurationUserInfoKey"] floatValue];
    CGRect endFrame = [dic[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    CGRect frame = [self.view convertRect:endFrame fromView:self.view.window];
    
    CGRect rect = self.inputView.frame;
    rect.origin.y = (frame.origin.y-rect.size.height);
    self.inputView.frame = rect;
    
    CGFloat TContentH = self.tableView.contentSize.height;
    CGFloat tableViewH = self.tableView.bounds.size.height;
    CGFloat keyboardH = frame.size.height;
    
    CGFloat offsetY = 0;
    if (TContentH < tableViewH) {
        offsetY = TContentH+keyboardH-tableViewH;
        if (offsetY < 0) {
            offsetY = 0;
        }
    }
    else {
        offsetY = keyboardH;
    }
    
    if (offsetY > 0) {
        CGRect TRect = self.tableView.frame;
        if (frame.origin.y == self.view.bounds.size.height) {
            //键盘收回
            TRect.origin.y = LL_NAV_TOP_H;
            [UIView animateWithDuration:duration animations:^{
                self.tableView.frame = TRect;
            }];
        }
        else {
            //键盘谈起
            TRect.origin.y = LL_NAV_TOP_H-offsetY;
            [UIView animateWithDuration:duration animations:^{
                self.tableView.frame = TRect;
                [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:(self.messageModels.count-1) inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
            }];
        }
    }
}

- (void)sendMessage:(UIButton *)btn {
    
    [self sendMessageModel:[self createTextModel]];
}

- (void)sendMessageModel:(LLBaseMessageModel *)model {
    [self.messageModels addObject:model];
    [_tableView reloadData];
    //    [self.textView reloadInputViews];
}

- (LLTextMessageModel *)createTextModel {
    LLTextMessageModel *model = [[LLTextMessageModel alloc] init];
    model.fromId = @"1";
    model.toId = @"2";
    model.fromNick = @"小弈";
    model.toNick = @"大弈";
    model.fromAvatar = @"";
    model.toAvatar = @"";
    model.content = self.textView.text;
    model.timestamp = [[NSDate date] timeIntervalSince1970];
    model.isSender = YES;
    model.isGroup = NO;
    model.sendType = (LLMessageSendType)arc4random()%3;
    
    //测试
    static BOOL isSender = NO;
    model.isSender = isSender;
    isSender = !isSender;
    
    return model;
}

- (LLImageMessageModel *)createImageModel {
    LLImageMessageModel *model = [[LLImageMessageModel alloc] init];
    model.fromId = @"1";
    model.toId = @"2";
    model.fromNick = @"小弈";
    model.toNick = @"大弈";
    model.fromAvatar = @"";
    model.toAvatar = @"";
    model.content = self.textView.text;
    model.timestamp = [[NSDate date] timeIntervalSince1970];
    model.isSender = YES;
    model.isGroup = NO;
    model.sendType = (LLMessageSendType)arc4random()%3;
    model.imgW = 20+arc4random()%200;
    model.imgH = 20+arc4random()%200;
    
    //测试
    static BOOL isSender = NO;
    model.isSender = isSender;
    isSender = !isSender;
    
    return model;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageModels.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.messageModels.count) {
        LLBaseMessageModel *model = [self.messageModels objectAtIndex:indexPath.row];
        [model cacheModelSize];
        return model.modelH+60;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.messageModels.count) {
        
        LLBaseMessageTableViewCell *cell;
        LLBaseMessageModel *model = [self.messageModels objectAtIndex:indexPath.row];
        
        if ([model isKindOfClass:[LLTextMessageModel class]]) {
            LLTextMessageModel *textModel = (LLTextMessageModel *)model;
            cell = [tableView dequeueReusableCellWithIdentifier:@"textCell"];
            if (cell == nil) {
                cell = [[LLTextMessageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"textCell"];
            }
            [cell setConfig:textModel];
        }
        else if ([model isKindOfClass:[LLImageMessageModel class]]) {
            LLImageMessageModel *imageModel = (LLImageMessageModel *)model;
            cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell"];
            if (cell == nil) {
                cell = [[LLImageMessageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"imageCell"];
            }
            [cell setConfig:imageModel];
        }
        else if ([model isKindOfClass:[LLVoiceMessageModel class]]) {
            LLVoiceMessageModel *voiceModel = (LLVoiceMessageModel *)model;
        }
        else if ([model isKindOfClass:[LLVideoMessageModel class]]) {
            LLVideoMessageModel *videoModel = (LLVideoMessageModel *)model;
        }
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noDataCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"noDataCell"];
    }
    return cell;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"删除");
    }];
    deleteAction.backgroundColor = [UIColor redColor];
    return @[deleteAction];
}

#pragma mark - getter
- (UITableView *)tableView {
    if (_tableView == nil) {
        CGRect rect = self.view.bounds;
        rect.origin.y = LL_NAV_TOP_H;
        rect.size.height -= (LL_NAV_TOP_H+LL_INPUT_H);
        
        _tableView = [[UITableView alloc] initWithFrame:rect];
        _tableView.delegate = self;
        _tableView.dataSource = self;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 110000
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
#else
        self.automaticallyAdjustsScrollViewInsets = NO;
#endif
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor colorWithRed:240/255. green:240/255. blue:240/255. alpha:1];
    }
    return _tableView;
}

- (UIView *)inputView {
    if (_inputView == nil) {
        _inputView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tableView.frame), LL_SCREEN_WIDTH, LL_INPUT_H)];
        _inputView.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LL_SCREEN_WIDTH, 0.5)];
        lineView.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
        [_inputView addSubview:lineView];
    }
    return _inputView;
}

- (UITextView *)textView {
    if (_textView == nil) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 7, LL_SCREEN_WIDTH-70, 35)];
        _textView.font = [UIFont systemFontOfSize:13];
        _textView.textColor = [UIColor darkTextColor];
        _textView.layer.masksToBounds = YES;
        _textView.layer.cornerRadius = 2;
        _textView.layer.borderWidth = 0.5;
        _textView.layer.borderColor = [UIColor colorWithRed:200/255. green:200/255. blue:200/255. alpha:1].CGColor;
    }
    return _textView;
}

- (UIButton *)sendBtn {
    if (_sendBtn == nil) {
        _sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendBtn.frame = CGRectMake(CGRectGetMaxX(self.textView.frame), 7, 70, 35);
        _sendBtn.backgroundColor = THEME_COLOR;
        _sendBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _sendBtn.layer.masksToBounds = YES;
        _sendBtn.layer.cornerRadius = 2;
        [_sendBtn setTitle:@"发送" forState:UIControlStateNormal];
        [_sendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sendBtn addTarget:self action:@selector(sendMessage:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendBtn;
}

- (NSMutableArray *)messageModels {
    if (_messageModels == nil) {
        _messageModels = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _messageModels;
}

@end
