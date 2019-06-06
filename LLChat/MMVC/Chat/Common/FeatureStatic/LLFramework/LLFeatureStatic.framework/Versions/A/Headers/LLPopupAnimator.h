//
//  LLPopupAnimator.h
//  LLFoundation
//
//  Created by zhaomengWang on 17/3/3.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LLPopupAnimatorDelegate;

@interface LLPopupAnimator : UIView

@property (nonatomic, weak) id<LLPopupAnimatorDelegate> delegate;

+ (instancetype)animator;
- (void)popUpView:(UIView *)view animationStyle:(LLAnimationStyle)animationStyle duration:(NSTimeInterval)duration completion:(doBlock)completion;
- (void)dismiss:(BOOL)animated completion:(doBlock)completion;

@end

@protocol LLPopupAnimatorDelegate <NSObject>

@optional
- (void)dismissAnimationCompletion;

@end
