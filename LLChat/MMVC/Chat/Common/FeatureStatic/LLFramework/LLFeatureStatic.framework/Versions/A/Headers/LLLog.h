//
//  MyLog.h
//  LLFeature
//
//  Created by WangZhaomeng on 2017/9/27.
//  Copyright © 2017年 WangZhaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLLog : NSObject

void ll_openLogEnable(BOOL enable);

void ll_log(NSString *format, ...);

@end
