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
    NSDictionary *dic1 = [[NSDictionary alloc] initWithContentsOfFile:path1];
    [emoticons addObject:dic1];
    //浪小花
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"LLEmoticon2" ofType:@"plist"];
    NSDictionary *dic2 = [[NSDictionary alloc] initWithContentsOfFile:path2];
    [emoticons addObject:dic2];
    //emojis
    NSString *peoplePath = [[NSBundle mainBundle] pathForResource:@"LLEmojis" ofType:@"plist"];
    NSDictionary *emojis = [NSDictionary dictionaryWithContentsOfFile:peoplePath];
    NSArray *peopleEmojis = [emojis objectForKey:@"Default"];
    [emoticons addObject:peopleEmojis];
    self.emoticons = [emoticons copy];
}

@end
