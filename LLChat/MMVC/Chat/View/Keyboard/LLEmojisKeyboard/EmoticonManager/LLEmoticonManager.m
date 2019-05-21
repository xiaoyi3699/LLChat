//
//  LLEmoticonManager.m
//  LLChat
//
//  Created by WangZhaomeng on 2019/5/17.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//

#import "LLEmoticonManager.h"

@implementation LLEmoticonManager

+ (instancetype)manager {
    static LLEmoticonManager *m;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        m = [[LLEmoticonManager alloc] init];
    });
    return m;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self loadEmoticons];
    }
    return self;
}

- (void)loadEmoticons {
    NSMutableArray *emoticons = [[NSMutableArray alloc] initWithCapacity:0];
    //默认表情
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"LLEmoticon1" ofType:@"plist"];
    NSArray *array1 = [[NSArray alloc] initWithContentsOfFile:path1];
    [emoticons addObject:array1];
    //浪小花
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"LLEmoticon2" ofType:@"plist"];
    NSArray *array2 = [[NSArray alloc] initWithContentsOfFile:path2];
    [emoticons addObject:array2];
    //emojis
    NSString *emojisPath = [[NSBundle mainBundle] pathForResource:@"LLEmojis" ofType:@"plist"];
    NSDictionary *emojisDic = [NSDictionary dictionaryWithContentsOfFile:emojisPath];
    NSArray *emojis = [emojisDic objectForKey:@"Default"];
    [emoticons addObject:emojis];
    self.emoticons = [emoticons copy];
    
    NSMutableArray *chs = [[NSMutableArray alloc] initWithCapacity:0];
    NSMutableArray *cht = [[NSMutableArray alloc] initWithCapacity:0];
    
}

@end
