//
//  LLIMMessage.h
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/4.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import "LLIMBaseModel.h"

@interface LLIMMessage : LLIMBaseModel

@property (nonatomic, strong) NSString *fromId;
@property (nonatomic, strong) NSString *toId;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) NSInteger timestamp;

@end
