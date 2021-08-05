//
//  TCLGADInterstitialHandler.m
//  MKADMob_Example
//
//  Created by xiaoxu on 2021/8/4.
//  Copyright © 2021 zhumingke. All rights reserved.
//

#import "TCLGADInterstitialHandler.h"

@interface TCLGADInterstitialHandler ()<GADFullScreenContentDelegate>
{
    NSString *_adUnitID;
}
@end

@implementation TCLGADInterstitialHandler

- (instancetype)initWithAdUnitID:(NSString *)adUnitID {
    self = [super init];
    if (self) {
        _adUnitID = adUnitID;
        [self requestInterstitialAd];
    }
    return self;
}

- (void)requestInterstitialAd {
    GADRequest *request = [GADRequest request];
    [GADInterstitialAd loadWithAdUnitID:_adUnitID request:request completionHandler:^(GADInterstitialAd * _Nullable interstitialAd, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Failed to load interstitial ad with error: %@", [error localizedDescription]);
            return;
        }
        self.interstitialAd = interstitialAd;
        self.interstitialAd.fullScreenContentDelegate = self;
    }];
}

- (void)showInterstitialAd:(UIViewController *)viewController {
    if (self.interstitialAd) {
        [self.interstitialAd presentFromRootViewController:viewController];
    } else {
        NSLog(@"Ad wasn't ready");
    }
}

- (void)gadState:(TCLGADInterstitialState)state {
    if (self.gadDelegate && [self.gadDelegate respondsToSelector:@selector(tclGADInterstitialState:)]) {
        [self.gadDelegate tclGADInterstitialState:state];
    }
}

#pragma mark - GADFullScreenContentDelegate
- (void)adDidRecordImpression:(nonnull id<GADFullScreenPresentingAd>)ad {
    
}

- (void)adDidRecordClick:(nonnull id<GADFullScreenPresentingAd>)ad {
    [self gadState:TCLGADInterstitialStateOfDidClickAd];
}

- (void)ad:(nonnull id<GADFullScreenPresentingAd>)ad didFailToPresentFullScreenContentWithError:(nonnull NSError *)error {
    [self gadState:TCLGADInterstitialStateOfFailPresent];
}

- (void)adDidPresentFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
    [self gadState:TCLGADInterstitialStateOfDidPresent];
}

- (void)adWillDismissFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
    [self gadState:TCLGADInterstitialStateOfWillDismiss];
}

- (void)adDidDismissFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
    [self gadState:TCLGADInterstitialStateOfDidDismiss];
    //GADInterstitialAd 是一次性对象。这意味着，插页式广告一经展示便不能再次展示。建议在插页广告消失后重启请求
    [self requestInterstitialAd];
}

@end
