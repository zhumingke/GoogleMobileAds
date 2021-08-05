//
//  TCLGADBannerViewHandler.m
//  MKADMob_Example
//
//  Created by xiaoxu on 2021/8/3.
//  Copyright © 2021 zhumingke. All rights reserved.
//

#import "TCLGADBannerViewHandler.h"

@interface TCLGADBannerViewHandler ()<GADBannerViewDelegate>
{
    UIView      *_superView;
    CGFloat     _btmMargin;
    GADAdSize   _adSize;
}
@end

@implementation TCLGADBannerViewHandler

- (instancetype)initWithADUnitID:(NSString *)adUnitID rootViewController:(UIViewController *)rootViewController superView:(UIView *)superView adHeight:(CGFloat)adHeight bottomMargin:(CGFloat)bottomMargin {
    self = [super init];
    if (self) {
        self.autoShowAD = YES;
        
        _btmMargin = bottomMargin;
        
        self.gadBannerView = [[GADBannerView alloc] init];
        self.gadBannerView.alpha = 0.0;
        if (adHeight > 0) {
            _adSize = GADAdSizeFromCGSize(CGSizeMake(superView.frame.size.width, adHeight));
        } else {
            _adSize = GADAdSizeFromCGSize(CGSizeMake(superView.frame.size.width, 50));
        }
        self.gadBannerView.adSize = _adSize;
        self.gadBannerView.adUnitID = adUnitID;
        self.gadBannerView.rootViewController = rootViewController;
        self.gadBannerView.delegate = self;
        self.gadBannerView.translatesAutoresizingMaskIntoConstraints = NO;
        if (superView) {
            _superView = superView;
            [superView addSubview:self.gadBannerView];
            [superView addConstraints:@[
                [NSLayoutConstraint constraintWithItem:self.gadBannerView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeBottom multiplier:1 constant:-bottomMargin],
                [NSLayoutConstraint constraintWithItem:self.gadBannerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]
            ]];
        }
        
        [self.gadBannerView loadRequest:[GADRequest request]];
        
    }
    return self;
}

- (void)addSubviewIn:(UIView *)superView {
    _superView = superView;
    
    [superView addSubview:self.gadBannerView];
    [superView addConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.gadBannerView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeBottom multiplier:1 constant:-_btmMargin],
        [NSLayoutConstraint constraintWithItem:self.gadBannerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]
    ]];
}

- (void)requestAD {
    [self.gadBannerView loadRequest:[GADRequest request]];
}

- (void)gadState:(TCLGADBannerState)state {
    if (self.gadDelegate && [self.gadDelegate respondsToSelector:@selector(tclGADBannerState:)]) {
        [self.gadDelegate tclGADBannerState:state];
    }
}
#pragma mark - GADBannerViewDelegate
- (void)bannerViewDidReceiveAd:(GADBannerView *)bannerView {
    if (self.autoShowAD && self.gadBannerView.alpha < 1.0) {
        [UIView animateWithDuration:0.25 animations:^{
            self.gadBannerView.alpha = 1.0;
        }];
    }
    [self gadState:TCLGADBannerStateOfDidReceiveAd];
}
- (void)bannerView:(GADBannerView *)bannerView didFailToReceiveAdWithError:(NSError *)error {
    [self gadState:TCLGADBannerStateOfFailReceiveAd];
}
- (void)bannerViewDidRecordClick:(GADBannerView *)bannerView {
    [self gadState:TCLGADBannerStateOfDidClickAd];
}
- (void)bannerViewWillPresentScreen:(GADBannerView *)bannerView {
    [self gadState:TCLGADBannerStateOfWillPresentScreen];
}
- (void)bannerViewWillDismissScreen:(GADBannerView *)bannerView {
    [self gadState:TCLGADBannerStateOfWillDismissScreen];
}
- (void)bannerViewDidDismissScreen:(GADBannerView *)bannerView {
    [self gadState:TCLGADBannerStateOfDidDismissScreen];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}
@end
