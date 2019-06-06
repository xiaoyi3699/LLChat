//
//  LLNetWorking.h
//  LLFoundation
//
//  Created by zhaomengWang on 17/3/23.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLNetWorking : NSObject

@property (nonatomic, assign) LLNetRequestContentType requestContentType;

+ (instancetype)netWorking;

- (NSURLSessionDataTask *)request:(NSURLRequest *)request callBack:(void(^)(id responseObject,NSError *error))callBack;

- (NSURLSessionDataTask *)method:(NSString *)method url:(NSString *)url parameters:(id)parameters callBack:(void(^)(id responseObject,NSError *error))callBack;

- (NSURLSessionDataTask *)GET:(NSString *)url parameters:(id)parameters callBack:(void(^)(id responseObject,NSError *error))callBack;

- (NSURLSessionDataTask *)POST:(NSString *)url parameters:(id)parameters callBack:(void(^)(id responseObject,NSError *error))callBack;

- (NSURLSessionDataTask *)PUT:(NSString *)url parameters:(id)parameters callBack:(void(^)(id responseObject,NSError *error))callBack;

- (NSURLSessionDataTask *)DELETE:(NSString *)url parameters:(id)parameters callBack:(void(^)(id responseObject,NSError *error))callBack;

- (NSURLSessionDataTask *)PATCH:(NSString *)url parameters:(id)parameters callBack:(void(^)(id responseObject,NSError *error))callBack;

- (NSURLSessionDataTask *)HEAD:(NSString *)url parameters:(id)parameters callBack:(void(^)(id responseObject,NSError *error))callBack;

@end
