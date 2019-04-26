//
//  LLChatViewController.m
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLChatViewController.h"
#import "LLInputView.h"
#import "LLChatSystemCell.h"
#import "LLChatTextMessageCell.h"
#import "LLChatImageMessageCell.h"

@interface LLChatViewController ()<UITableViewDelegate,UITableViewDataSource,LLInputViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) LLInputView *inputView;
@property (nonatomic, strong) NSMutableArray *messageModels;
@property (nonatomic, assign) BOOL isEditing;
@property (nonatomic, strong) LLChatUserModel *userModel;

@end

@implementation LLChatViewController

- (instancetype)initWithUser:(LLChatUserModel *)userModel {
    self = [super init];
    if (self) {
        self.title = @"消息";
        self.userModel = userModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.inputView];
}

#pragma mark - 输入框代理
- (void)inputView:(LLInputView *)inputView sendMessage:(NSString *)message {
    
    //模拟发送与接收消息
    //更改isSender参数值
    static BOOL isSender = NO;
    isSender = !isSender;
    //end
    
    LLTextMessageModel *model = [LLChatMessageManager createTextMessage:self.userModel
                                                                message:message
                                                               isSender:isSender
                                                                isGroup:NO];
    [self sendMessageModel:model];
}

- (void)inputView:(LLInputView *)inputView selectedType:(LLChatMoreType)type {
    if (type == LLChatMoreTypeImage) {
        //发送图片
        //选择图片的代码就不多写了, 这里假定已经选择了图片
        
        //原图, 用于发送
        UIImage *orImage = [UIImage imageNamed:@"1.jpg"];
        
        //缩略图, 用于展示, 优化消息滑动时的卡顿
        //将原图按照一定的算法压缩处理成缩略图, 这里直接使用外部生成的缩略图,
        UIImage *thImage = [UIImage imageNamed:@"1_t.jpg"];
        
        //将图片上传到服务器, 图片消息只是把图片的链接发送过去, 接收端根据链接展示图片
        //上传图片的代码就不多写, 具体上传方式根据自身服务器api决定, 这里假定图片已经上传到服务器上了, 并且返回了两个链接, 原图和缩略图
        //原图和缩略图链接
        NSString *original = @"http://www.vasueyun.cn/llgit/llchat/1.jpg";
        NSString *thumbnail = @"http://www.vasueyun.cn/llgit/llchat/1_t.jpg";
        
        [[LLChatImageCache imageCache] storeImage:orImage forKey:original];
        [[LLChatImageCache imageCache] storeImage:thImage forKey:thumbnail];
        
        //创建图片model
        LLImageMessageModel *model = [LLChatMessageManager createImageMessage:self.userModel
                                                                    thumbnail:thumbnail
                                                                     original:original
                                                                     isSender:YES
                                                                      isGroup:NO];
        
        //图片尺寸
        model.imgW = orImage.size.width;
        model.imgH = orImage.size.height;
        
        [self sendMessageModel:model];
    }
    else if (type == LLChatMoreTypeVideo) {
        //发送视频
    }
    else if (type == LLChatMoreTypeLocation) {
        //发送定位 - 未实现
    }
    else if (type == LLChatMoreTypeTransfer) {
        //文件互传 - 未实现
    }
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
        if ([model isKindOfClass:[LLSystemMessageModel class]]) {
            return model.modelH;
        }
        if (self.userModel.isShowName) {
            return model.modelH+45;
        }
        else {
            return model.modelH+32;
        }
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.messageModels.count) {
        
        LLChatBaseCell *cell;
        LLBaseMessageModel *model = [self.messageModels objectAtIndex:indexPath.row];
        
        if ([model isKindOfClass:[LLSystemMessageModel class]]) {
            LLSystemMessageModel *systemModel = (LLSystemMessageModel *)model;
            cell = [tableView dequeueReusableCellWithIdentifier:@"systemCell"];
            if (cell == nil) {
                cell = [[LLChatSystemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"systemCell"];
            }
            [cell setConfig:systemModel];
        }
        else if ([model isKindOfClass:[LLTextMessageModel class]]) {
            LLTextMessageModel *textModel = (LLTextMessageModel *)model;
            cell = [tableView dequeueReusableCellWithIdentifier:@"textCell"];
            if (cell == nil) {
                cell = [[LLChatTextMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"textCell"];
            }
            [cell setConfig:textModel isShowName:self.userModel.isShowName];
        }
        else if ([model isKindOfClass:[LLImageMessageModel class]]) {
            LLImageMessageModel *imageModel = (LLImageMessageModel *)model;
            cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell"];
            if (cell == nil) {
                cell = [[LLChatImageMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"imageCell"];
            }
            [cell setConfig:imageModel isShowName:self.userModel.isShowName];
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

#pragma mark - getter
- (UITableView *)tableView {
    if (_tableView == nil) {
        CGRect rect = self.view.bounds;
        rect.origin.y = LLCHAT_NAV_TOP_H;
        rect.size.height -= (LLCHAT_NAV_TOP_H+LLCHAT_INPUT_H+LLCHAT_BOTTOM_H);
        
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
        _inputView = [[LLInputView alloc] init];
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

#pragma mark - 键盘状态代理
- (void)inputView:(LLInputView *)inputView willChangeFrameWithDuration:(CGFloat)duration isEditing:(BOOL)isEditing {
    self.isEditing = isEditing;
    
    CGFloat TContentH = self.tableView.contentSize.height;
    CGFloat tableViewH = self.tableView.bounds.size.height;
    CGFloat keyboardH = LLCHAT_SCREEN_HEIGHT-self.inputView.minY-LLCHAT_INPUT_H;

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
    
    CGRect TRect = self.tableView.frame;
    if (offsetY > 0) {
        TRect.origin.y = LLCHAT_NAV_TOP_H-offsetY+LLCHAT_BOTTOM_H;
        [UIView animateWithDuration:duration animations:^{
            self.tableView.frame = TRect;
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:(self.messageModels.count-1) inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        }];
    }
    else {
        TRect.origin.y = LLCHAT_NAV_TOP_H;
        [UIView animateWithDuration:duration animations:^{
            self.tableView.frame = TRect;
        }];
    }
}


#pragma mark - private method
- (void)sendMessageModel:(LLBaseMessageModel *)model {
    
    //添加模拟时间
    static NSInteger i = 0;
    if (i%3 == 0) {
        LLSystemMessageModel *sModel = [[LLSystemMessageModel alloc] init];
        sModel.message = @"10:55";
        [self addMessageModel:sModel];
    }
    i ++;
    //end
    
    [self addMessageModel:model];
}

//收到消息
- (void)receiveMessageModel:(LLBaseMessageModel *)model {
    [self addMessageModel:model];
}

//加入到消息缓存中
- (void)addMessageModel:(LLBaseMessageModel *)model {
    [self.messageModels addObject:model];
    [_tableView reloadData];
    [self tableViewScrollToBottom];
}

- (void)tableViewScrollToBottom {
    if (self.isEditing) {
        CGFloat TContentH = self.tableView.contentSize.height;
        CGFloat tableViewH = self.tableView.bounds.size.height;
        
        CGFloat keyboardH = LLCHAT_SCREEN_HEIGHT-self.inputView.minY-LLCHAT_INPUT_H;
        
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
            TRect.origin.y = LLCHAT_NAV_TOP_H-offsetY+LLCHAT_BOTTOM_H;
            [UIView animateWithDuration:0.25 animations:^{
                self.tableView.frame = TRect;
                [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:(self.messageModels.count-1) inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
            }];
        }
    }
    else {
        CGFloat TContentH = self.tableView.contentSize.height;
        CGFloat tableViewH = self.tableView.bounds.size.height;
        if (TContentH > tableViewH) {
            [UIView animateWithDuration:0.25 animations:^{
                [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:(self.messageModels.count-1) inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
            }];
        }
    }
}

#pragma mark - super method
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
