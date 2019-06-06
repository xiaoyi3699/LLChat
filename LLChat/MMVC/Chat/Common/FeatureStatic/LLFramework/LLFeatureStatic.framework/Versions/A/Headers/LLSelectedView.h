//
//  LLSelectedView.h
//  LLRoundedImage
//
//  Created by WangZhaomeng on 2017/7/10.
//  Copyright © 2017年 MaoChao Network Co. Ltd. All rights reserved.
//  视图选择器

#import <UIKit/UIKit.h>
@protocol LLSelectedViewDelegate;

@interface LLSelectedView : UIView

@property (nonatomic, assign) NSInteger selectedIndex;       //当前选中的索引值
@property (nonatomic, strong) UIButton  *selectedBtn;        //当前选中的btn
@property (nonatomic, strong) UIColor   *titleColor;         //颜色
@property (nonatomic, strong) UIColor   *selectedTitleColor; //选中颜色
@property (nonatomic, strong) UIColor   *lineColor;          //底部线条颜色
@property (nonatomic, strong) UIColor   *selectedLineColor;  //选中时底部线条颜色
@property (nonatomic, weak) id<LLSelectedViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles titleFont:(UIFont *)font index:(NSInteger)index;

@end

@protocol LLSelectedViewDelegate <NSObject>

@optional
- (void)selectedView:(LLSelectedView *)selectedView selectedAtIndex:(NSInteger)index;

@end
