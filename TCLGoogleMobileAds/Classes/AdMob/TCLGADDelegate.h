//
//  TCLGADDelegate.h
//  MKADMob_Example
//
//  Created by xiaoxu on 2021/8/3.
//  Copyright © 2021 zhumingke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TCLGADNativeAdView.h"

/** 横幅广告回调结果 */
typedef NS_ENUM(NSInteger, TCLGADBannerState) {
    TCLGADBannerStateOfDidReceiveAd,          /** 请求到横幅广告 */
    TCLGADBannerStateOfFailReceiveAd,         /** 请求横幅广告失败 */
    TCLGADBannerStateOfDidClickAd,            /** 点击横幅广告 */
    TCLGADBannerStateOfWillPresentScreen,     /** 将要展示横幅广告页 */
    TCLGADBannerStateOfWillDismissScreen,     /** 横幅广告页将要退出 */
    TCLGADBannerStateOfDidDismissScreen       /** 横幅广告页退出 */
};

/** 激励广告回调结果 */
typedef NS_ENUM(NSInteger, TCLGADRewardedState) {
    TCLGADRewardedStateOfDidClickAd,        /** 点击激励广告 */
    TCLGADRewardedStateOfFailPresent,       /** 激励广告推出失败 */
    TCLGADRewardedStateOfDidPresent,        /** 推出激励广告 */
    TCLGADRewardedStateOfWillDismiss,       /** 激励广告页将要消失*/
    TCLGADRewardedStateOfDidDismiss         /** 激励广告页消失 */
};

/** 原生广告回调结果 */
typedef NS_ENUM(NSInteger, TCLGADLoaderState) {
    TCLGADLoaderStateOfDidReceiveAd,            /** 获取原生广告 */
    TCLGADLoaderStateOfFailAd,                  /** 获取原生广告失败 */
    TCLGADLoaderStateOfDidFinishLoading,        /** 原生广告加载完成 */
    TCLGADLoaderStateOfDidClickAd,              /** 点击原生广告 */
    TCLGADLoaderStateOfWillPresent,             /** 原生广告页将要退出 */
    TCLGADLoaderStateOfWillDismiss,             /** 原生广告页将要消失 */
    TCLGADLoaderStateOfDidDismiss               /** 原生广告页消失 */
};

/** 插页广告回调结果 */
typedef NS_ENUM(NSInteger, TCLGADInterstitialState) {
    TCLGADInterstitialStateOfDidClickAd,            /** 点击插页广告 */
    TCLGADInterstitialStateOfFailPresent,           /** 退出插页广告失败 */
    TCLGADInterstitialStateOfDidPresent,            /** 退出插页广告 */
    TCLGADInterstitialStateOfWillDismiss,           /** 插页广告将要消失 */
    TCLGADInterstitialStateOfDidDismiss             /** 插页广告消失 */
};

NS_ASSUME_NONNULL_BEGIN

@protocol TCLGADDelegate <NSObject>

@optional
/// 横幅广告状态回调
- (void)tclGADBannerState:(TCLGADBannerState)tclGADBannerState;

/// 激励广告状态回调
- (void)tclGADRewardedState:(TCLGADRewardedState)tclGADRewardedState;

/// 原生广告状态回调
- (void)tclGADLoaderState:(TCLGADLoaderState)tclGADLoaderState nativeAd:(TCLGADNativeAdView *)adView;

/// 插页广告状态回调
- (void)tclGADInterstitialState:(TCLGADInterstitialState)tclGADInterstitialState;

@end

NS_ASSUME_NONNULL_END
