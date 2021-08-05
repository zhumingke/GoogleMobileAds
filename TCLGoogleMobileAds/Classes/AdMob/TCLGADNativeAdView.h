//
//  TCLGADNativeAdView.h
//  MKADMob_Example
//
//  Created by xiaoxu on 2021/8/4.
//  Copyright © 2021 zhumingke. All rights reserved.
//
//  自定义原生广告

#import <GoogleMobileAds/GoogleMobileAds.h>


@interface TCLGADNativeAdView : GADNativeAdView

@property (nonatomic , strong) GADNativeAd *tclNativeAd;

///icon
@property (nonatomic , strong) UIImageView *tclIconImageView;
///icon imageUrl
@property (nonatomic , strong) NSURL *tclIconUrl;

///标题label
@property (nonatomic , strong) UILabel *tclHeadLabel;

///详情label
@property (nonatomic , strong) UILabel *tclBodyLabel;

///广告imageview
@property (nonatomic , strong) UIImageView *tclImageView;
///imageview url
@property (nonatomic , strong) NSURL *tclImageViewUrl;

///按钮
@property (nonatomic , strong) UIButton *tclCallActionBtn;

///广告商label
@property (nonatomic , strong) UILabel *tclAdvertiserLabel;

///商店label
@property (nonatomic , strong) UILabel *tclStoreLabel;

///价格label
@property (nonatomic , strong) UILabel *tclPriceLabel;

///星级评分(数值)
@property (nonatomic , assign) double tclRatingValue;

///视频mediaView
@property (nonatomic , strong) GADMediaView *tclMediaView;

/// 初始化自定义广告
/// @param gadNativeAd 原生广告
- (instancetype)initWithGADNativeAd:(GADNativeAd *)gadNativeAd;

@end

