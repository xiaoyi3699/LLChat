//
//  LLIMBaseModel.m
//  LLFeature
//
//  Created by WangZhaomeng on 2017/9/21.
//  Copyright © 2017年 WangZhaomeng. All rights reserved.
//

#import "LLIMBaseModel.h"
#import <objc/runtime.h>

@implementation LLIMBaseModel

+ (instancetype)ll_unarchiveObjectWithData:(NSData *)data {
    
    if ([self conformsToProtocol:@protocol(NSCoding)] && data) {
        
        if (class_respondsToSelector(self, @selector(initWithCoder:))) {
            return [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }
    }
    return nil;
}

#pragma mark - 使用runtime进行解档与归档。
- (void)encodeWithCoder:(NSCoder *)aCoder {
    unsigned int count = 0;
    Ivar *ivarLists = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        const char* name = ivar_getName(ivarLists[i]);
        NSString* strName = [NSString stringWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:strName] forKey:strName];
    }
    free(ivarLists);
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivarLists = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++) {
            const char* name = ivar_getName(ivarLists[i]);
            NSString* strName = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
            id value = [aDecoder decodeObjectForKey:strName];
            if (value) {
                [self setValue:value forKey:strName];
            }
        }
        free(ivarLists);
    }
    return self;
}

#pragma mark - debug测试
#if DEBUG //打印日志
- (NSString *)description {
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    unsigned int count = 0;
    //objc_property_t *properties = class_copyPropertyList([self class], &count);
    Ivar *ivarLists = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i ++) {
        //objc_property_t property = properties[i];
        //NSString *name = @(property_getName(property));
        const char* name = ivar_getName(ivarLists[i]);
        NSString* strName = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
        id value = [self valueForKey:strName] ? : nil;
        [dic setValue:value forKey:strName];
    }
    //free(properties);
    free(ivarLists);
    return [NSString stringWithFormat:@"<%@: %p> -- %@",[self class],self,dic];
}

- (NSString *)debugDescription {
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    unsigned int count = 0;
    //objc_property_t *properties = class_copyPropertyList([self class], &count);
    Ivar *ivarLists = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i ++) {
        //objc_property_t property = properties[i];
        //NSString *name = @(property_getName(property));
        const char* name = ivar_getName(ivarLists[i]);
        NSString* strName = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
        id value = [self valueForKey:strName] ? : nil;
        [dic setValue:value forKey:strName];
    }
    //free(properties);
    free(ivarLists);
    return [NSString stringWithFormat:@"<%@: %p> -- %@",[self class],self,dic];
}
#endif

@end

@implementation NSData (LLIMBaseModel)

+ (NSData *)ll_archivedDataWithModel:(LLIMBaseModel *)model {
    if ([model conformsToProtocol:@protocol(NSCoding)] && model) {
        if ([model respondsToSelector:@selector(encodeWithCoder:)]) {
            return [NSKeyedArchiver archivedDataWithRootObject:model];
        }
    }
    return nil;
}

@end
