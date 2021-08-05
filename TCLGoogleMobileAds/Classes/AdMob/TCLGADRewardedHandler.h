//
//  TCLGADRewardedHandler.h
//  MKADMob_Example
//
//  Created by xiaoxu on 2021/8/3.
//  Copyright © 2021 zhumingke. All rights reserved.
//
//  激励广告

#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
#import "TCLGADDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface TCLGADRewardedHandler : NSObject


/// 激励广告，建议引用
/// @param adUnitID 激励广告id
- (instancetype)initWithAdUnitID:(NSString *)adUnitID;

/// 请求激励广告
- (void)requestRewardedAd;

/// 显示激励广告页
- (void)showRewardedAd:(UIViewController *)viewController;

/// 激励广告
@property (nonatomic , strong) GADRewardedAd *rewardedAd;

@property (nonatomic , weak) id<TCLGADDelegate> gadDelegate;

@end

NS_ASSUME_NONNULL_END
