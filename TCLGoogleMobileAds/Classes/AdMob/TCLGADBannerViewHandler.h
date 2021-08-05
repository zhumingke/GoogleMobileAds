//
//  TCLGADBannerViewHandler.h
//  MKADMob_Example
//
//  Created by xiaoxu on 2021/8/3.
//  Copyright © 2021 zhumingke. All rights reserved.
//
//  横幅广告

#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
#import "TCLGADDelegate.h"


@interface TCLGADBannerViewHandler : NSObject


/// 横幅广告：GADBannerView，建议引用
/// @param adUnitID 广告id
/// @param rootViewController rootVC
/// @param superView 父视图，当为nil时才会在代理中返回bannerView
/// @param adSize 横幅广告尺寸，默认kGADAdSizeBanner
/// @param bottomMargin 距离父视图底部约束,默认显示底部
- (instancetype)initWithADUnitID:(NSString *)adUnitID rootViewController:(UIViewController *)rootViewController superView:(UIView *)superView adSize:(CGSize)adSize bottomMargin:(CGFloat)bottomMargin;

///添加广告
- (void)addSubviewIn:(UIView *)superView;

///广告请求，默认初始化时自动请求
- (void)requestAD;

@property (nonatomic , weak) id<TCLGADDelegate> gadDelegate;

///横幅广告
@property (nonatomic , strong) GADBannerView *gadBannerView;

///自动展示广告，默认yes
@property (nonatomic , assign) BOOL autoShowAD;

@end

