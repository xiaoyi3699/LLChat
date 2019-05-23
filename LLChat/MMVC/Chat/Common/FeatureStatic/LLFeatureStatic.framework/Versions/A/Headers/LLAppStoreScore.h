//
//  LLAppStoreScore.h
//  LLCommonStatic
//
//  Created by WangZhaomeng on 2018/5/22.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLAppStoreScore : NSObject

+ (instancetype)shareScore;
- (void)showScoreView:(LLAppStoreType)type isOnce:(BOOL)isOnce;

@end
