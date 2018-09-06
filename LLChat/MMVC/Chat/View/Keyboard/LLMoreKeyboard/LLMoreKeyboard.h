//
//  LLMoreKeyboard.h
//  LLChat
//
//  Created by WangZhaomeng on 2018/9/5.
//  Copyright © 2018年 WangZhaomeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LLMoreKeyboardDelegate;

typedef enum : NSInteger {
    LLMoreTypeImage = 0,
    LLMoreTypeVideo,
    LLMoreTypeLocation,
    LLMoreTypeTransfer,
}LLMoreType;
@interface LLMoreKeyboard : UIView

@property (nonatomic, weak) id<LLMoreKeyboardDelegate> delegate;

@end

@protocol LLMoreKeyboardDelegate <NSObject>

@optional
- (void)moreKeyboardSelectedType:(LLMoreType)type;

@end
