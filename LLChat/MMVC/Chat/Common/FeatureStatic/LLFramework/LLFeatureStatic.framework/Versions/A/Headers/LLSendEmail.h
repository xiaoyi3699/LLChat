//
//  LLSendEmail.h
//  LLCommonSDK
//
//  Created by WangZhaomeng on 2018/2/8.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface LLSendEmail : NSObject

///多个收件人以“,”隔开
@property (nonatomic, strong) NSString *recipients;
///邮件主题
@property (nonatomic, strong) NSString *subject;
///邮件内容
@property (nonatomic, strong) NSString *body;

- (void)send;

@end

@interface UIViewController (LLSendEmail)<MFMailComposeViewControllerDelegate>

- (void)sendEmail:(LLSendEmail *)email;

@end
