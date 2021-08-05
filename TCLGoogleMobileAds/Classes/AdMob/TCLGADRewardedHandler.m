//
//  TCLGADRewardedHandler.m
//  MKADMob_Example
//
//  Created by xiaoxu on 2021/8/3.
//  Copyright © 2021 zhumingke. All rights reserved.
//

#import "TCLGADRewardedHandler.h"

@interface TCLGADRewardedHandler ()<GADFullScreenContentDelegate>
{
    NSString *_adUnitID;
}
@end
@implementation TCLGADRewardedHandler

- (instancetype)initWithAdUnitID:(NSString *)adUnitID {
    self = [super init];
    if (self) {
        _adUnitID = adUnitID;
        [self requestRewardedAd];
    }
    return self;
}

- (void)requestRewardedAd {
    GADRequest *request = [GADRequest request];
    [GADRewardedAd loadWithAdUnitID:_adUnitID request:request completionHandler:^(GADRewardedAd * _Nullable rewardedAd, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Rewarded ad failed to load with error: %@", [error localizedDescription]);
            return;
        }
        self.rewardedAd = rewardedAd;
        self.rewardedAd.fullScreenContentDelegate = self;
    }];
}

- (void)showRewardedAd:(UIViewController *)viewController {
    if (self.rewardedAd) {
        [self.rewardedAd presentFromRootViewController:viewController userDidEarnRewardHandler:^{
            //TODO：处理用户激励
            //GADAdReward *reward = self.rewardedAd.adReward;
        }];
    } else {
        NSLog(@"Ad wasn't ready");
    }
}

- (void)gadState:(TCLGADRewardedState)state {
    if (self.gadDelegate && [self.gadDelegate respondsToSelector:@selector(tclGADRewardedState:)]) {
        [self.gadDelegate tclGADRewardedState:state];
    }
}

#pragma mark - GADFullScreenContentDelegate
- (void)adDidRecordImpression:(nonnull id<GADFullScreenPresentingAd>)ad {
    
}

- (void)adDidRecordClick:(nonnull id<GADFullScreenPresentingAd>)ad {
    [self gadState:TCLGADRewardedStateOfDidClickAd];
}

- (void)ad:(id<GADFullScreenPresentingAd>)ad didFailToPresentFullScreenContentWithError:(NSError *)error {
    [self gadState:TCLGADRewardedStateOfFailPresent];
    //GADRewardedAd是一次性对象，激励广告展示一次后就不能再展示了。
    //[self requestRewardedAd];
}

- (void)adDidPresentFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
    [self gadState:TCLGADRewardedStateOfDidPresent];
}

- (void)adWillDismissFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
    [self gadState:TCLGADRewardedStateOfWillDismiss];
}

- (void)adDidDismissFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
    [self gadState:TCLGADRewardedStateOfDidDismiss];
    //GADRewardedAd是一次性对象，激励广告展示一次后就不能再展示了。建议在激励广告页消失后再次请求激励广告
    [self requestRewardedAd];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
