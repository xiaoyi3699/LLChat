//
//  LLBaseHeaderView.h
//  LLFeature
//
//  Created by WangZhaomeng on 2017/11/25.
//  Copyright © 2017年 WangZhaomeng. All rights reserved.
//

#import "LLBaseComponent.h"

@interface LLBaseHeaderView : LLBaseComponent

+ (instancetype)headerWithRefreshingTarget:(id)target refreshingAction:(SEL)action;

@end
