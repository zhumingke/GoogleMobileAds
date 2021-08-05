#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "TCLGADADLoaderHandler.h"
#import "TCLGADBannerViewHandler.h"
#import "TCLGADDelegate.h"
#import "TCLGADInterstitialHandler.h"
#import "TCLGADNativeAdView.h"
#import "TCLGADRewardedHandler.h"

FOUNDATION_EXPORT double TCLGoogleMobileAdsVersionNumber;
FOUNDATION_EXPORT const unsigned char TCLGoogleMobileAdsVersionString[];

