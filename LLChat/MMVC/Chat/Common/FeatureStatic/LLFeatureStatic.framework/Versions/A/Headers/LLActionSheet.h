//
//  LLActionSheet.h
//  LLFoundation
//
//  Created by WangZhaomeng on 2017/7/11.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LLActionSheetDelegate;

@interface LLActionSheet : UIView

@property (nonatomic, weak) id<LLActionSheetDelegate> delegete;

- (instancetype)initWithMessage:(NSString *)message titles:(NSArray *)titles;
- (void)showCompletion:(doBlock)completion;
- (void)showInView:(UIView *)aView completion:(doBlock)completion;
- (void)dismiss;

@end

@protocol LLActionSheetDelegate <NSObject>

@optional
- (void)actionSheet:(LLActionSheet *)actionSheet didSelectedAtIndex:(NSInteger)index;

@end
