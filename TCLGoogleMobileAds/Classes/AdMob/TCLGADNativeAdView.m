//
//  TCLGADNativeAdView.m
//  MKADMob_Example
//
//  Created by xiaoxu on 2021/8/4.
//  Copyright © 2021 zhumingke. All rights reserved.
//

#import "TCLGADNativeAdView.h"

@implementation TCLGADNativeAdView

- (instancetype)initWithGADNativeAd:(GADNativeAd *)gadNativeAd {
    self = [super init];
    if (self) {
        self.tclNativeAd = gadNativeAd;
        self.tclIconImageView.image = gadNativeAd.icon.image;
        self.tclIconUrl = gadNativeAd.icon.imageURL;
        self.tclHeadLabel.text = gadNativeAd.headline;
        self.tclBodyLabel.text = gadNativeAd.body;
        if (gadNativeAd.images && gadNativeAd.images.count > 0) {
            GADNativeAdImage *gadNativeAdImage = gadNativeAd.images.firstObject;
            self.tclImageView.image = gadNativeAdImage.image;
            self.tclImageViewUrl = gadNativeAdImage.imageURL;
        }
        if (gadNativeAd.mediaContent.hasVideoContent) {
            self.tclMediaView.mediaContent = gadNativeAd.mediaContent;
        }
        [self.tclCallActionBtn setTitle:gadNativeAd.callToAction forState:UIControlStateNormal];
        self.tclAdvertiserLabel.text = gadNativeAd.advertiser;
        self.tclStoreLabel.text = gadNativeAd.store;
        self.tclPriceLabel.text = gadNativeAd.price;
        self.tclRatingValue = gadNativeAd.starRating.doubleValue;
        
        self.nativeAd = gadNativeAd;
        self.iconView = self.tclIconImageView;
        self.headlineView = self.tclHeadLabel;
        self.bodyView = self.tclBodyLabel;
        self.imageView = self.tclImageView;
        self.callToActionView = self.tclCallActionBtn;
        self.advertiserView = self.tclAdvertiserLabel;
        self.storeView = self.tclStoreLabel;
        self.priceView = self.tclPriceLabel;
        self.mediaView = self.tclMediaView;
    }
    return self;
}

- (GADNativeAd *)tclNativeAd {
    if (!_tclNativeAd) {
        _tclNativeAd = [[GADNativeAd alloc] init];
    }
    return _tclNativeAd;
}

- (UIImageView *)tclIconImageView {
    if (!_tclIconImageView) {
        _tclIconImageView = [[UIImageView alloc] init];
        [self addSubview:_tclIconImageView];
    }
    return _tclIconImageView;
}

- (UILabel *)tclHeadLabel {
    if (!_tclHeadLabel) {
        _tclHeadLabel = [[UILabel alloc] init];
        _tclHeadLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_tclHeadLabel];
    }
    return _tclHeadLabel;
}

- (UILabel *)tclBodyLabel {
    if (!_tclBodyLabel) {
        _tclBodyLabel = [[UILabel alloc] init];
        _tclBodyLabel.font = [UIFont systemFontOfSize:10];
        _tclBodyLabel.numberOfLines = 0;
        [self addSubview:_tclBodyLabel];
    }
    return _tclBodyLabel;
}

- (UIImageView *)tclImageView {
    if (!_tclImageView) {
        _tclImageView = [[UIImageView alloc] init];
        [self addSubview:_tclImageView];
    }
    return _tclImageView;
}

- (UIButton *)tclCallActionBtn {
    if (!_tclCallActionBtn) {
        _tclCallActionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tclCallActionBtn setTitleColor:UIColor.systemBlueColor forState:UIControlStateNormal];
        _tclCallActionBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_tclCallActionBtn];
    }
    return _tclCallActionBtn;
}

- (UILabel *)tclAdvertiserLabel {
    if (!_tclAdvertiserLabel) {
        _tclAdvertiserLabel = [[UILabel alloc] init];
        _tclAdvertiserLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_tclAdvertiserLabel];
    }
    return _tclAdvertiserLabel;
}

- (UILabel *)tclStoreLabel {
    if (!_tclStoreLabel) {
        _tclStoreLabel = [[UILabel alloc] init];
        _tclStoreLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_tclStoreLabel];
    }
    return _tclStoreLabel;
}

- (UILabel *)tclPriceLabel {
    if (!_tclPriceLabel) {
        _tclPriceLabel = [[UILabel alloc] init];
        _tclPriceLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_tclPriceLabel];
    }
    return _tclPriceLabel;
}

- (GADMediaView *)tclMediaView {
    if (!_tclMediaView) {
        _tclMediaView = [[GADMediaView alloc] init];
        [self addSubview:_tclMediaView];
    }
    return _tclMediaView;
}

@end
