//
//  LLKeychain.h
//  LLFeature
//
//  Created by WangZhaomeng on 2017/9/22.
//  Copyright © 2017年 WangZhaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLKeychain : NSObject

+ (NSString *)getPasswordForUsername:(NSString *)username
                      andServiceName:(NSString *)serviceName
                               error:(NSError **)error;

+ (BOOL)storeUsername:(NSString *)username
          andPassword:(NSString *)password
       forServiceName:(NSString *)serviceName
       updateExisting:(BOOL)updateExisting
                error:(NSError **) error;

+ (BOOL)deleteItemForUsername:(NSString *)username
               andServiceName:(NSString *)serviceName
                        error:(NSError **)error;

+ (BOOL)purgeItemsForServiceName:(NSString *)serviceName
                           error:(NSError **)error;

@end
