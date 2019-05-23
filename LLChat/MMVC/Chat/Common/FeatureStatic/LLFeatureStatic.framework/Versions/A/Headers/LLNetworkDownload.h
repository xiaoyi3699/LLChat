//
//  LLNetworkDownload.h
//  LLFoundation
//
//  Created by WangZhaomeng on 2017/4/28.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLNetworkDownload : NSObject

@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *filePath;

///开始
- (void)start;

///暂停
- (void)pause;

@end
