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
/// @param superView 父视图
/// @param adHeight 横幅广告高度，默认50，宽度默认屏幕宽度
/// @param bottomMargin 距离父视图底部约束
- (instancetype)initWithADUnitID:(NSString *)adUnitID rootViewController:(UIViewController *)rootViewController superView:(UIView *)superView adHeight:(CGFloat)adHeight bottomMargin:(CGFloat)bottomMargin;

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

