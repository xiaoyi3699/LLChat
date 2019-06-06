//
//  LLLogModel.h
//  LLFeatureStatic
//
//  Created by WangZhaomeng on 2018/9/26.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLLogModel : NSObject

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSAttributedString *attributedText;
@property (assign, nonatomic) NSInteger height;

- (NSInteger)setConfigWithWidth:(NSInteger)width font:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
