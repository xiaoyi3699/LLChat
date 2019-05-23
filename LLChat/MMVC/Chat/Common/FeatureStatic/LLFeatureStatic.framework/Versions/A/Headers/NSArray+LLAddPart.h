//
//  NSArray+AddPart.h
//  LLFoundation
//
//  Created by wangzhaomeng on 16/9/14.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LLAddPart)

- (nullable id)ll_takingValueStyle:(LLTakingValueStyle)style;

- (nullable id)ll_objectAtIndex:(NSUInteger)index;

- (nullable id)ll_randomObject;

#pragma mark - 谓词搜索
- (nullable NSArray *)ll_filteredArrayWithKey:(nonnull NSString *)key;

@end

@interface NSMutableArray (LLAddPart)

- (void)ll_removeFirstObject;

- (nullable id)ll_popFirstObject;

- (nullable id)ll_popLastObject;

- (void)ll_addObject:(nonnull id)anObject;

- (void)ll_addObjectsFromArray:(nonnull NSArray *)objects;

- (void)ll_prependObject:(nonnull id)anObject;

- (void)ll_prependObjects:(nonnull NSArray *)objects;

- (void)ll_insertObject:(nonnull id)anObject atIndex:(NSUInteger)index;

- (void)ll_insertObjects:(nonnull NSArray *)objects atIndex:(NSUInteger)index;

- (void)ll_reverse;

- (void)ll_shuffle;

/* 数组排序
 1、创建随机数组
 NSMutableArray *nums = [[NSMutableArray alloc] initWithCapacity:20];
 for (NSInteger i = 0; i < 20; i ++) {
 NSInteger j = arc4random()%100;
 LLBaseModel *model = [[LLBaseModel alloc] init];
 model.age = j;
 [nums addObject:model];
 }
 
 2、排序(可变数组可自身排序)
 NSArray *array = [nums sortedArrayUsingComparator:^NSComparisonResult(LLBaseModel *obj1, LLBaseModel *obj2) {
 //按照升续排列
 if (obj1.age > obj2.age){
 return NSOrderedDescending;
 }
 else if (obj1.age == obj2.age){
 return NSOrderedSame;
 }
 else{
 return NSOrderedAscending;
 }
 }];
 
 3、打印排序结果
 for (NSInteger i = 0; i < 20; i ++) {
 LLBaseModel *model = array[i];
 ll_log(@"age=%ld",(long)model.age);
 }
 */

@end
