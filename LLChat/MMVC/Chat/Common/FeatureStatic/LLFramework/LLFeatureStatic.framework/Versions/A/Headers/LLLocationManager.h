//
//  LLLocation.h
//  dingwei
//
//  Created by wangzhaomeng on 16/8/4.
//  Copyright © 2016年 MaoChao Network Co. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@protocol LLLocationManagerDelegate;

@interface LLLocationManager : NSObject<CLLocationManagerDelegate>

@property (nonatomic, weak) id<LLLocationManagerDelegate> delegate;

- (void)starLocation;
- (void)stopLocation;

@end

@protocol LLLocationManagerDelegate <NSObject>
@optional
- (void)locationManager:(LLLocationManager *)locationManager didUpdatePlace:(NSArray<NSDictionary *> *)places;
- (void)locationManager:(LLLocationManager *)locationManager didFailWithError:(NSError *)error;

@end
