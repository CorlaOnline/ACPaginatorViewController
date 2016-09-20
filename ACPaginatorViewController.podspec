#
# Be sure to run `pod lib lint ACPaginatorViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ACPaginatorViewController'
  s.version          = '1.0.3'
  s.summary          = 'Simple way to create a list of view with a pagination transition.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Simple way to create a list of view with a pagination transition. You need only to set a list of viewControllers and other few stuff.
                       DESC

  s.homepage         = 'https://github.com/CorlaOnline/ACPaginatorViewController.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alex Corlatti' => 'alex.corlatti@gmail.com' }
  s.source           = { :git => 'https://github.com/CorlaOnline/ACPaginatorViewController.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/corlaOnline'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ACPaginatorViewController/Classes/**/*'

  # s.resource_bundles = {
  #   'ACPaginatorViewController' => ['ACPaginatorViewController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
