#
# Be sure to run `pod lib lint FileBox.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FileBox'
  s.version          = '0.4.2'
  s.summary          = ' iOS 快捷文件目录，支持快速查看文件信息，能加载音视频、图片、PDF文件等'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/ijinfeng/FileBox'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ijinfeng' => '851406283@qq.com' }
  s.source           = { :git => 'https://github.com/ijinfeng/FileBox.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'FileBox/FileBox/Classes/**/*'
  
   s.resource_bundles = {
     'FileBox' => ['FileBox/FileBox/Assets/**/*']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'SnapKit'
end
