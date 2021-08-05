//
//  TCLGADADLoaderHandler.m
//  MKADMob_Example
//
//  Created by xiaoxu on 2021/8/3.
//  Copyright © 2021 zhumingke. All rights reserved.
//

#import "TCLGADADLoaderHandler.h"

@interface TCLGADADLoaderHandler ()<GADAdLoaderDelegate, GADNativeAdLoaderDelegate, GADNativeAdDelegate>
{
    NSArray *_adTypes;
    NSArray *_options;
}
@end

@implementation TCLGADADLoaderHandler

- (instancetype)initWithAdUnitID:(NSString *)adUnitID rootViewController:(UIViewController *)rootViewController adTypes:(NSArray *)adTypes options:(NSArray *)options {
    self = [super init];
    if (self) {
        if (adTypes == nil) {
            adTypes = @[kGADAdLoaderAdTypeNative];
        }
        if (options == nil) {
            GADNativeAdMediaAdLoaderOptions *op = [[GADNativeAdMediaAdLoaderOptions alloc] init];
            options = @[op];
        }
        _adTypes = adTypes;
        _options = options;
        self.adLoader = [[GADAdLoader alloc] initWithAdUnitID:adUnitID rootViewController:rootViewController adTypes:adTypes options:options];
        self.adLoader.delegate = self;
        [self.adLoader loadRequest:[GADRequest request]];
    }
    return self;
}

- (void)requestLoaderAD {
    [self.adLoader loadRequest:[GADRequest request]];
}

- (void)gadState:(TCLGADLoaderState)state adView:(TCLGADNativeAdView *)adView {
    if (self.gadDelegate && [self.gadDelegate respondsToSelector:@selector(tclGADLoaderState:nativeAd:)]) {
        [self.gadDelegate tclGADLoaderState:state nativeAd:adView];
    }
}
#pragma mark - GADAdLoaderDelegate
- (void)adLoader:(GADAdLoader *)adLoader didFailToReceiveAdWithError:(NSError *)error {
    NSLog(@"GADAdLoader didFail  %@",error.localizedDescription);
    [self gadState:TCLGADLoaderStateOfFailAd adView:nil];
}
- (void)adLoaderDidFinishLoading:(GADAdLoader *)adLoader {
    [self gadState:TCLGADLoaderStateOfDidFinishLoading adView:nil];
}
#pragma mark - GADNativeAdLoaderDelegate
- (void)adLoader:(GADAdLoader *)adLoader didReceiveNativeAd:(GADNativeAd *)nativeAd {
    nativeAd.delegate = self;
    
    TCLGADNativeAdView *adView = [[TCLGADNativeAdView alloc] initWithGADNativeAd:nativeAd];
    [self gadState:TCLGADLoaderStateOfDidReceiveAd adView:adView];
}
#pragma mark - GADNativeAdDelegate
- (void)nativeAdDidRecordImpression:(nonnull GADNativeAd *)nativeAd {
    
}

- (void)nativeAdDidRecordClick:(nonnull GADNativeAd *)nativeAd {
    [self gadState:TCLGADLoaderStateOfDidClickAd adView:nil];
}

- (void)nativeAdWillPresentScreen:(nonnull GADNativeAd *)nativeAd {
    [self gadState:TCLGADLoaderStateOfWillPresent adView:nil];
}

- (void)nativeAdWillDismissScreen:(nonnull GADNativeAd *)nativeAd {
    [self gadState:TCLGADLoaderStateOfWillDismiss adView:nil];
}

- (void)nativeAdDidDismissScreen:(nonnull GADNativeAd *)nativeAd {
    [self gadState:TCLGADLoaderStateOfDidDismiss adView:nil];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
