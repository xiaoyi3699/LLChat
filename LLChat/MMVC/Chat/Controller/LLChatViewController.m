//
//  LLChatViewController.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLChatViewController.h"
#import "LLInputView.h"
#import "LLTextMessageTableViewCell.h"
#import "LLImageMessageTableViewCell.h"

@interface LLChatViewController ()<UITableViewDelegate,UITableViewDataSource,LLInputViewDelegate,LLIMServiceDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) LLInputView *inputView;
@property (nonatomic, strong) NSMutableArray *messageModels;
@property (nonatomic, assign) BOOL isEditing;

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
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    [LLIMServiceObserver shareInstance].delegate3 = self;;
}

- (void)onSendMessageSuccess:(LLIMMessage *)message {
    [_tableView reloadData];
}

- (void)onSendMessageFailed:(LLIMMessage *)message {
    [_tableView reloadData];
}

- (void)onReceiveMessage:(LLIMMessage *)message {
    LLBaseMessageModel *model = [LLIMServiceHelper createModelWithIMMessage:message];
    [self addMessageModel:model];
}

#pragma mark - 输入框代理
- (void)inputView:(LLInputView *)inputView sendMessage:(NSString *)message {
    
    LLTextMessageModel *model = [LLIMServiceHelper createTextModelWithText:message];
    [self addMessageModel:model];
    
    LLIMMessage *IMMessage = [LLIMServiceHelper createIMMessageWithModel:model];
    [[LLIMService shareInstance] sendMessage:IMMessage];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.inputView chatResignFirstResponder];
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

- (LLInputView *)inputView {
    if (_inputView == nil) {
        _inputView = [[LLInputView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tableView.frame), LL_SCREEN_WIDTH, LL_INPUT_H)];
        _inputView.delegate = self;
    }
    return _inputView;
}

- (NSMutableArray *)messageModels {
    if (_messageModels == nil) {
        _messageModels = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _messageModels;
}

#pragma mark - 监听键盘状态
- (void)keyboardWillShow:(NSNotification *)notification {
    self.isEditing = YES;
}

- (void)keyboardWillHide:(NSNotification *)notification {
    self.isEditing = NO;
}

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

#pragma mark - private method
- (void)addMessageModel:(LLBaseMessageModel *)model {
    [self.messageModels addObject:model];
    [_tableView reloadData];
    [self tableViewScrollToBottom];
}

- (void)setupUI {
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.inputView];
}

- (void)tableViewScrollToBottom {
    if (self.isEditing) {
        CGFloat TContentH = self.tableView.contentSize.height;
        CGFloat tableViewH = self.tableView.bounds.size.height;
        
        CGFloat keyboardH = LL_SCREEN_HEIGHT-self.inputView.maxY;
        
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
            TRect.origin.y = LL_NAV_TOP_H-offsetY;
            [UIView animateWithDuration:0.25 animations:^{
                self.tableView.frame = TRect;
                [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:(self.messageModels.count-1) inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
            }];
        }
    }
}

#pragma mark - super method
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
