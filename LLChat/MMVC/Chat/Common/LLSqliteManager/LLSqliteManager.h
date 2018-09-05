//
//  LLSqliteManager.h
//  LLFoundation
//
//  Created by Mr.Wang on 16/12/30.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLSqliteManager : NSObject

+ (instancetype)defaultManager;

- (BOOL)createTableName:(NSString *)tableName dic:(NSDictionary *)dic;
- (BOOL)createTableName:(NSString *)tableName modelClass:(Class)modelClass;

- (long)insertDic:(NSDictionary *)dic tableName:(NSString *)tableName;
- (long)insertModel:(id)model tableName:(NSString *)tableName;

- (BOOL)updateDic:(NSDictionary *)dic tableName:(NSString *)tableName primkey:(NSString *)primkey;
- (BOOL)updateModel:(id)model tableName:(NSString *)tableName primkey:(NSString *)primkey;

- (NSMutableArray *)selectWithSql:(NSString *)sql;
- (long)deleteWithSql:(NSString *)sql;

@end
