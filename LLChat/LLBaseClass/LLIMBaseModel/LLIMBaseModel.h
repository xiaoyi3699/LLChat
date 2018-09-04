//
//  LLIMBaseModel.h
//  LLFeature
//
//  Created by WangZhaomeng on 2017/9/21.
//  Copyright © 2017年 WangZhaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLIMBaseModel : NSObject<NSCoding>

///解档
+ (instancetype)ll_unarchiveObjectWithData:(NSData *)data;

@end

@interface NSData (LLIMBaseModel)

///归档
+ (NSData *)ll_archivedDataWithModel:(LLIMBaseModel *)model;

@end
