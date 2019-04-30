//
//  LLChatDBManager.m
//  LLChat
//
//  Created by WangZhaomeng on 2019/4/29.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//

#import "LLChatDBManager.h"
#import "LLChatTool.h"

NSString *const LL_USER    = @"ll_user";
NSString *const LL_GROUP   = @"ll_group";
NSString *const LL_SESSION = @"ll_session";

@implementation LLChatDBManager

+ (instancetype)DBManager {
    static LLChatDBManager *DBManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DBManager = [[LLChatDBManager alloc] init];
    });
    return DBManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        //创建三张表 <user, group, session>
        [[LLChatSqliteManager defaultManager] createTableName:LL_USER modelClass:[LLChatUserModel class]];
        [[LLChatSqliteManager defaultManager] createTableName:LL_GROUP modelClass:[LLChatGroupModel class]];
        [[LLChatSqliteManager defaultManager] createTableName:LL_SESSION modelClass:[LLChatSessionModel class]];
    }
    return self;
}

- (void)autoCreateUser:(NSInteger)count {
    for (NSInteger i = 0; i < count; i ++) {
        LLChatUserModel *model = [[LLChatUserModel alloc] init];
        model.uid = [NSString stringWithFormat:@"%05ld",(long)(i+1)];
        model.name = model.uid;
        model.avatar = @"http://www.vasueyun.cn/ttdoll/512.png";
        model.isShowName = YES;
        [self insertUserModel:model];
    }
}

#pragma mark - user表操纵
//所有用户
- (NSMutableArray *)users {
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@",LL_USER];
    NSArray *list = [[LLChatSqliteManager defaultManager] selectWithSql:sql];
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:list.count];
    for (NSDictionary *dic in list) {
        LLChatUserModel *model = [LLChatUserModel modelWithDic:dic];
        [arr addObject:model];
    }
    return arr;
}

//添加用户
- (void)insertUserModel:(LLChatUserModel *)model {
    [[LLChatSqliteManager defaultManager] insertModel:model tableName:LL_USER];
}

//更新用户
- (void)updateUserModel:(LLChatUserModel *)model {
    [[LLChatSqliteManager defaultManager] updateModel:model tableName:LL_USER primkey:@"uid"];
}

//查询用户
- (LLChatUserModel *)selectUserModel:(NSString *)uid {
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE uid = '%@'",LL_USER,uid];
    NSArray *list = [[LLChatSqliteManager defaultManager] selectWithSql:sql];
    if (list.count > 0) {
        LLChatUserModel *model = [LLChatUserModel modelWithDic:list.firstObject];
        return model;
    }
    return nil;
}

//删除用户
- (void)deleteUserModel:(NSString *)uid {
    NSString *sql = [NSString stringWithFormat:@"DELETE * FROM %@ WHERE uid = '%@'",LL_USER,uid];
    [[LLChatSqliteManager defaultManager] execute:sql];
    //同时删除对应的会话
    [self deleteSessionModel:uid];
}

#pragma mark - group表操纵
//所有群
- (NSMutableArray *)groups {
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@",LL_GROUP];
    NSArray *list = [[LLChatSqliteManager defaultManager] selectWithSql:sql];
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:list.count];
    for (NSDictionary *dic in list) {
        LLChatGroupModel *model = [LLChatGroupModel modelWithDic:dic];
        [arr addObject:model];
    }
    return arr;
}

//添加群
- (void)insertGroupModel:(LLChatGroupModel *)model {
    [[LLChatSqliteManager defaultManager] insertModel:model tableName:LL_GROUP];
}

//更新群
- (void)updateGroupModel:(LLChatGroupModel *)model {
    [[LLChatSqliteManager defaultManager] updateModel:model tableName:LL_GROUP primkey:@"gid"];
}

//查询群
- (LLChatGroupModel *)selectGroupModel:(NSString *)gid {
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE gid = '%@'",LL_GROUP,gid];
    NSArray *list = [[LLChatSqliteManager defaultManager] selectWithSql:sql];
    if (list.count > 0) {
        LLChatGroupModel *model = [LLChatGroupModel modelWithDic:list.firstObject];
        return model;
    }
    return nil;
}

//删除群
- (void)deleteGroupModel:(NSString *)gid {
    NSString *sql = [NSString stringWithFormat:@"DELETE * FROM %@ WHERE gid = '%@'",LL_GROUP,gid];
    [[LLChatSqliteManager defaultManager] execute:sql];
    //同时删除对应的会话
    [self deleteSessionModel:gid];
}

#pragma mark - session表操纵
//所有会话
- (NSMutableArray *)sessions {
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@",LL_SESSION];
    NSArray *list = [[LLChatSqliteManager defaultManager] selectWithSql:sql];
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:list.count];
    for (NSDictionary *dic in list) {
        LLChatSessionModel *model = [LLChatSessionModel modelWithDic:dic];
        [arr addObject:model];
    }
    return arr;
}

//添加会话
- (void)insertSessionModel:(LLChatSessionModel *)model {
    [[LLChatSqliteManager defaultManager] insertModel:model tableName:LL_SESSION];
}

//更新会话
- (void)updateSessionModel:(LLChatSessionModel *)model {
    [[LLChatSqliteManager defaultManager] updateModel:model tableName:LL_SESSION primkey:@"sid"];
}

//查询私聊会话
- (LLChatSessionModel *)selectSessionModelWithUser:(LLChatUserModel *)userModel {
    return [self selectSessionModel:userModel];
}

//查询群聊会话
- (LLChatSessionModel *)selectSessionModelWithGroup:(LLChatGroupModel *)groupModel {
    return [self selectSessionModel:groupModel];
}

//private
- (LLChatSessionModel *)selectSessionModel:(LLChatBaseModel *)model {
    NSString *gid, *name, *avatar; BOOL isGroup;
    if ([model isKindOfClass:[LLChatUserModel class]]) {
        LLChatUserModel *user = (LLChatUserModel *)model;
        gid = user.uid;
        name = user.name;
        avatar = user.avatar;
        isGroup = NO;
    }
    else {
        LLChatGroupModel *group = (LLChatGroupModel *)model;
        gid = group.gid;
        name = group.name;
        avatar = group.avatar;
        isGroup = YES;
    }
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE sid = '%@'",LL_SESSION,gid];
    NSArray *list = [[LLChatSqliteManager defaultManager] selectWithSql:sql];
    LLChatSessionModel *session;
    if (list.count > 0) {
        session = [LLChatSessionModel modelWithDic:list.firstObject];
    }
    else {
        //创建会话,并插入数据库
        session = [[LLChatSessionModel alloc] init];
        session.sid = gid;
        session.name = name;
        session.avatar = avatar;
        session.isGroup = isGroup;
        [self insertSessionModel:session];
    }
    return session;
}

//删除会话
- (void)deleteSessionModel:(NSString *)sid {
    NSString *sql = [NSString stringWithFormat:@"DELETE * FROM %@ WHERE sid = '%@'",LL_SESSION,sid];
    [[LLChatSqliteManager defaultManager] execute:sql];
}

///查询会话对应的用户或者群聊
- (LLChatBaseModel *)selectChatModel:(LLChatSessionModel *)model {
    if (model.isGroup) {
        return [self selectGroupModel:model.sid];
    }
    else {
        return [self selectUserModel:model.sid];
    }
}

//查询会话对应的用户
- (LLChatUserModel *)selectChatUserModel:(LLChatSessionModel *)model {
    return [self selectUserModel:model.sid];
}

//查询会话对应的群聊
- (LLChatGroupModel *)selectChatGroupModel:(LLChatSessionModel *)model {
    return [self selectGroupModel:model.sid];
}

#pragma mark - message表操纵
//私聊消息
- (NSMutableArray *)messagesWithUser:(LLChatUserModel *)model {
    return [self messagesWithModel:model];
}

//群聊消息
- (NSMutableArray *)messagesWithGroup:(LLChatGroupModel *)model {
    return [self messagesWithModel:model];
}

//private
- (NSMutableArray *)messagesWithModel:(LLChatBaseModel *)model {
    NSString *tableName = [self tableNameWithModel:model];
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ ORDER BY timestamp DESC LIMIT 100",tableName];
    NSArray *list = [[LLChatSqliteManager defaultManager] selectWithSql:sql];
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:list.count];
    for (NSDictionary *dic in list) {
        LLChatMessageModel *model = [LLChatMessageModel modelWithDic:dic];
        [arr insertObject:model atIndex:0];
    }
    return arr;
}

//插入私聊消息
- (void)insertMessage:(LLChatMessageModel *)message chatWithUser:(LLChatUserModel *)model {
    [self insertMessage:message chatWithModel:model];
}

//插入群聊消息
- (void)insertMessage:(LLChatMessageModel *)message chatWithGroup:(LLChatGroupModel *)model {
    [self insertMessage:message chatWithModel:model];
}

//private
- (void)insertMessage:(LLChatMessageModel *)message chatWithModel:(LLChatBaseModel *)model{
    LLChatSessionModel *session = [self selectSessionModel:model];
    session.lastMsg = message.message;
    session.lastTimestamp = message.timestamp;
    [self updateSessionModel:session];
    
    NSString *tableName = [self tableNameWithModel:model];
    [[LLChatSqliteManager defaultManager] createTableName:tableName modelClass:[message class]];
    [[LLChatSqliteManager defaultManager] insertModel:message tableName:tableName];
}

//private
- (NSString *)tableNameWithModel:(LLChatBaseModel *)model {
    if ([model isKindOfClass:[LLChatUserModel class]]) {
        LLChatUserModel *user = (LLChatUserModel *)model;
        return [NSString stringWithFormat:@"user_%@",user.uid];
    }
    else {
        LLChatGroupModel *group = (LLChatGroupModel *)model;
        return [NSString stringWithFormat:@"group_%@",group.gid];
    }
}

@end
