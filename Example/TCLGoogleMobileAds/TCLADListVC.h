//
//  TCLADListVC.h
//  TCLGoogleMobileAds_Example
//
//  Created by xiaoxu on 2021/8/5.
//  Copyright © 2021 zhumingke. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ADType) {
    ADTypeBanner,
    ADTypeReward,
    ADTypeLoader,
    ADTypeInterstitial
};

NS_ASSUME_NONNULL_BEGIN

@interface TCLADListVC : UIViewController

@property (nonatomic , assign) ADType adtype;

@end

NS_ASSUME_NONNULL_END
