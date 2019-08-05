#
# Be sure to run `pod lib lint MusicDownloadButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MusicDownloadButton'
  s.version          = '0.1.2'
  s.summary          = 'MusicDownloadButton is a custom UIView subclass which works like Apple Music\'s download button.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'MusicDownloadButton is a custom UIView subclass which works like Apple Music\'s download button. It is available on GitHub'

  s.homepage         = 'https://github.com/rafaelc0sta/MusicDownloadButton'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rafael Costa' => 'rafael@rafaelcosta.me' }
  s.source           = { :git => 'https://github.com/rafaelc0sta/MusicDownloadButton.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'MusicDownloadButton/Classes/**/*'

  s.swift_versions = "4.2"  
 
  # s.resource_bundles = {
  #   'MusicDownloadButton' => ['MusicDownloadButton/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
