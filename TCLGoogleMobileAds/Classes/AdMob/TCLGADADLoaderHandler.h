//
//  TCLGADADLoaderHandler.h
//  MKADMob_Example
//
//  Created by xiaoxu on 2021/8/3.
//  Copyright © 2021 zhumingke. All rights reserved.
//
//  原生广告

#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
#import "TCLGADDelegate.h"



@interface TCLGADADLoaderHandler : NSObject


/// 原生广告，建议引用
/// @param adUnitID 广告id
/// @param rootViewController rootViewController
/// @param superView superView
/// @param adTypes 广告类型
/// @param options 广告设置
- (instancetype)initWithAdUnitID:(NSString *)adUnitID rootViewController:(UIViewController *)rootViewController adTypes:(NSArray *)adTypes options:(NSArray *)options;

///重新请求
- (void)requestLoaderAD;

@property (nonatomic , strong) GADAdLoader *adLoader;

@property (nonatomic , weak) id<TCLGADDelegate> gadDelegate;

@end


