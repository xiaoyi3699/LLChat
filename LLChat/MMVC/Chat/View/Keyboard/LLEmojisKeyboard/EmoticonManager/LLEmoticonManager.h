//
//  LLEmoticonManager.h
//  LLChat
//
//  Created by WangZhaomeng on 2019/5/17.
//  Copyright © 2019 WangZhaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLEmoticonManager : NSObject

///所有简体表情, 如: [爱你]
@property (nonatomic, strong) NSArray *chs;
///所有繁体表情, 如: [愛你]
@property (nonatomic, strong) NSArray *cht;

@end
