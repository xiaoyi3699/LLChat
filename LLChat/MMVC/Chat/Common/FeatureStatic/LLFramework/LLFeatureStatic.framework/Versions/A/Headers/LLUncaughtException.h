//
//  LLUncaughtException.h
//  LLCommonSDK
//
//  Created by WangZhaomeng on 2018/2/11.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLUncaughtException : NSObject

void LLInstallUncaughtExceptionHandler(void);

void LLUninstall(void);

@end
