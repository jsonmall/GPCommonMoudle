#
# Be sure to run `pod lib lint ZGpNewCommon.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZGpNewCommon'
  s.version          = '0.1.5'
  s.summary          = ' 数据驱动组件的tableView和safeKit'
  

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'git@code.aliyun.com:XZSpecs_iOS/XZGpNewCommon'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gordon' => 'Gordon.Guo@zhan.com' }
  s.source           = { :git => 'git@code.aliyun.com:XZSpecs_iOS/XZGpNewCommon.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ZGpNewCommon/Classes/**/*'
  
   s.resource_bundles = {
     'ZGpNewCommon' => ['ZGpNewCommon/Assets/*.png']
   }
   s.prefix_header_file = 'ZGpNewCommon/Classes/XZGPCommonHeader.h'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
