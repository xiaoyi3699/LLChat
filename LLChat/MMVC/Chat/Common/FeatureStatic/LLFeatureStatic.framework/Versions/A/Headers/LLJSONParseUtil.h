//
//  LLJSONParseUtil.h
//  LLFoundation
//
//  Created by wangzhaomeng on 16/8/17.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLJSONParseUtil : NSObject

+ (long long)getLongValueInDict:(NSDictionary *)dict withKey:(NSString *)key;

+ (NSInteger)getIntValueInDict:(NSDictionary *)dict withKey:(NSString *)key;

+ (BOOL)getBoolValueInDict:(NSDictionary *)dict withKey:(NSString *)key;

+ (float)getFloatValueInDict:(NSDictionary *)dict withKey:(NSString *)key;

+ (NSNumber *)getNumberValueInDict:(NSDictionary *)dict withKey:(NSString *)key;

+ (NSString *)getStringValueInDict:(NSDictionary *)dict withKey:(NSString *)key;

+ (NSDictionary *)getDictionaryValueInDict:(NSDictionary *)dict withKey:(NSString *)key;

+ (NSArray *)getArrayValueInDict:(NSDictionary *)dict withKey:(NSString *)key;

+ (NSMutableArray *)getMutableArrayValueInDict:(NSDictionary *)dict withKey:(NSString *)key;

@end
