//
//  NSDateFormatter+LLAddPart.h
//  test
//
//  Created by XHL on 16/8/16.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (LLAddPart)

+ (NSDateFormatter *)ll_defaultDateFormatter;
+ (NSDateFormatter *)ll_detailDateFormatter;
+ (NSDateFormatter *)ll_dateFormatter:(NSString *)f;

@end
