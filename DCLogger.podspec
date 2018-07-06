#
# Be sure to run `pod lib lint DCLogger.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DCLogger'
  s.version          = '1.0.1'
  s.summary          = 'A lightweight logger tool for your iOS/tvOS app.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
DCLogger allow you to get pretty log information.
                       DESC

  s.homepage         = 'https://github.com/dcortes22/DCLogger'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dcortes22' => 'dcortes22@gmail.com' }
  s.source           = { :git => 'https://github.com/dcortes22/DCLogger.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/dcortes22'

  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'DCLogger/Classes/**/*'

  # s.resource_bundles = {
  #   'DCLogger' => ['DCLogger/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
