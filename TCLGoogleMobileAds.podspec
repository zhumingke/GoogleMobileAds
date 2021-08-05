#
# Be sure to run `pod lib lint TCLGoogleMobileAds.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TCLGoogleMobileAds'
  s.version          = '0.1.1'
  s.summary          = 'TCLGoogleMobileAds.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        横幅、插页、原生、激励广告
                        指定Google-Mobile-Ads-SDK版本 ‘8.8.0’
                       DESC

  s.homepage         = 'http://gitlab09.tclking.com/ios/compents/tclgooglemobileads'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhumingke' => 'mingke.zhu@tcl.com' }
  s.source           = { :git => 'http://gitlab09.tclking.com/ios/compents/tclgooglemobileads.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'TCLGoogleMobileAds/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TCLGoogleMobileAds' => ['TCLGoogleMobileAds/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  s.static_framework = true
  
  # 谷歌广告
  s.dependency 'Google-Mobile-Ads-SDK', '~> 8.8.0'
end
