//
//  TCLGADInterstitialHandler.h
//  MKADMob_Example
//
//  Created by xiaoxu on 2021/8/4.
//  Copyright © 2021 zhumingke. All rights reserved.
//
//  插页广告

#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
#import "TCLGADDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface TCLGADInterstitialHandler : NSObject

/// 插页广告，建议引用
/// @param adUnitID 激励广告id
- (instancetype)initWithAdUnitID:(NSString *)adUnitID;

/// 请求插页广告
- (void)requestInterstitialAd;

/// 显示插页广告
- (void)showInterstitialAd:(UIViewController *)viewController;

/// 插页广告
@property (nonatomic , strong) GADInterstitialAd *interstitialAd;

@property (nonatomic , weak) id<TCLGADDelegate> gadDelegate;

@end

NS_ASSUME_NONNULL_END
