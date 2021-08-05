//
//  TCLADListVC.m
//  TCLGoogleMobileAds_Example
//
//  Created by xiaoxu on 2021/8/5.
//  Copyright © 2021 zhumingke. All rights reserved.
//

#import "TCLADListVC.h"
#import <Masonry/Masonry.h>
#import "TCLGADBannerViewHandler.h"
#import "TCLGADRewardedHandler.h"
#import "TCLGADADLoaderHandler.h"
#import "TCLGADInterstitialHandler.h"

static NSString * const BannerGoogleID = @"ca-app-pub-3940256099942544/2934735716";
static NSString * const RewardGoogleID = @"ca-app-pub-3940256099942544/1712485313";
static NSString * const LoaderGoogleID = @"ca-app-pub-3940256099942544/3986624511";
static NSString * const InterstitialGoogleID = @"ca-app-pub-3940256099942544/4411468910";

@interface TCLADListVC ()<TCLGADDelegate>

@property (nonatomic , strong) TCLGADBannerViewHandler *bannerHandler;
@property (nonatomic , strong) TCLGADRewardedHandler *rewardedHandler;
@property (nonatomic , strong) TCLGADADLoaderHandler *loaderHandler;
@property (nonatomic , strong) TCLGADInterstitialHandler *interstitialHandler;

@end

@implementation TCLADListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.whiteColor;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(requestAction) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"request" forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(40);
    }];
    
    if (self.adtype == ADTypeBanner) {
        [self setupADBannerView];
    } else if (self.adtype == ADTypeReward) {
        [self setupRewardedView];
    } else if (self.adtype == ADTypeLoader) {
        [self setupNativeAdView];
    } else if (self.adtype == ADTypeInterstitial) {
        [self setupInterstitial];
    }
}

- (void)requestAction {
    if (self.adtype == ADTypeBanner) {
        [self.bannerHandler requestAD];
    } else if (self.adtype == ADTypeReward) {
        //[self.rewardedHandler requestRewardedAd];
    } else if (self.adtype == ADTypeLoader) {
        [self.loaderHandler requestLoaderAD];
    } else if (self.adtype == ADTypeInterstitial) {
        //[self.interstitialHandler requestInterstitialAd];
    }
}

- (void)setupADBannerView {
    self.bannerHandler = [[TCLGADBannerViewHandler alloc] initWithADUnitID:BannerGoogleID rootViewController:self superView:self.view adHeight:100 bottomMargin:30];
    self.bannerHandler.gadDelegate = self;
}

- (void)setupRewardedView {
    self.rewardedHandler = [[TCLGADRewardedHandler alloc] initWithAdUnitID:RewardGoogleID];
    self.rewardedHandler.gadDelegate = self;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"tag_ad"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(adAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(60, 36));
    }];
    
}

- (void)setupNativeAdView {
    //会出发多次回调
    GADMultipleAdsAdLoaderOptions *multipleAdsOptions =
          [[GADMultipleAdsAdLoaderOptions alloc] init];
    multipleAdsOptions.numberOfAds = 5;
    
    self.loaderHandler = [[TCLGADADLoaderHandler alloc] initWithAdUnitID:LoaderGoogleID rootViewController:self adTypes:nil options:nil];
    self.loaderHandler.gadDelegate = self;
}

- (void)setupInterstitial {
    self.interstitialHandler = [[TCLGADInterstitialHandler alloc] initWithAdUnitID:InterstitialGoogleID];
    self.interstitialHandler.gadDelegate = self;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"tag_ad"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(adAction2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(60, 36));
    }];
}

//展示激励广告
- (void)adAction {
    [self.rewardedHandler showRewardedAd:self];
}

//展示插页广告
- (void)adAction2 {
    [self.interstitialHandler showInterstitialAd:self];
}

#pragma mark - TCLGADDelegate
//横幅广告回调
- (void)tclGADBannerState:(TCLGADBannerState)tclGADBannerState {
    
}

//激励广告回调
- (void)tclGADRewardedState:(TCLGADRewardedState)tclGADRewardedState {
    
}

//原生广告回调
- (void)tclGADLoaderState:(TCLGADLoaderState)tclGADLoaderState nativeAd:(TCLGADNativeAdView *)adView {
    
    if (tclGADLoaderState == TCLGADLoaderStateOfDidReceiveAd) {
        for (UIView *view in self.view.subviews) {
            if ([view isKindOfClass:[TCLGADNativeAdView class]]) {
                [view removeFromSuperview];
            }
        }
        
        [self.view addSubview:adView];
        [adView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(300, 300));
        }];
        adView.backgroundColor = [UIColor.lightGrayColor colorWithAlphaComponent:0.3];
        
        [adView.tclIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.left.mas_equalTo(20);
            make.width.height.mas_equalTo(40);
        }];
        
        UILabel *ratingLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 60, 12)];
        ratingLabel.font = [UIFont systemFontOfSize:12];
        ratingLabel.textColor = UIColor.systemBlueColor;
        ratingLabel.text = [NSString stringWithFormat:@"评分%.1f",adView.tclRatingValue];
        [adView addSubview:ratingLabel];

        [adView.tclHeadLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(adView.tclIconImageView);
            make.left.equalTo(adView.tclIconImageView.mas_right).offset(15);
            make.right.mas_equalTo(-20);
            make.height.mas_equalTo(15);
        }];

        [adView.tclBodyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(adView.tclHeadLabel.mas_bottom);
            make.left.right.equalTo(adView.tclHeadLabel);
            make.bottom.equalTo(adView.tclIconImageView.mas_bottom);
        }];

        if (adView.tclNativeAd.mediaContent.hasVideoContent) {
            [adView.tclMediaView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(adView.tclBodyLabel.mas_bottom).offset(20);
                make.centerX.equalTo(adView);
                make.width.mas_equalTo(250);
                make.height.mas_equalTo(150);
            }];
        } else {
            [adView.tclImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(adView.tclBodyLabel.mas_bottom).offset(20);
                make.centerX.equalTo(adView);
                make.width.mas_equalTo(250);
                make.height.mas_equalTo(150);
            }];
        }
        
        [adView.tclCallActionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(adView);
        }];
        
        [adView.tclPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(adView.tclCallActionBtn.mas_left).offset(-10);
            make.centerY.equalTo(adView.tclCallActionBtn);
        }];

        [adView.tclStoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.equalTo(adView);
        }];
        
        [adView.tclAdvertiserLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.centerX.equalTo(adView);
        }];
    }
}

//插页广告回调
- (void)tclGADInterstitialState:(TCLGADInterstitialState)tclGADInterstitialState {
    
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
