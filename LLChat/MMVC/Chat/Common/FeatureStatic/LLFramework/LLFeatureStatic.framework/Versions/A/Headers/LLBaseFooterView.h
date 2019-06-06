//
//  LLBaseFooterView.h
//  LLFeature
//
//  Created by WangZhaomeng on 2017/11/25.
//  Copyright © 2017年 WangZhaomeng. All rights reserved.
//

#import "LLBaseComponent.h"

@interface LLBaseFooterView : LLBaseComponent

+ (instancetype)footerWithRefreshingTarget:(id)target refreshingAction:(SEL)action;

@end
