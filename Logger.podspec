#
# Be sure to run `pod lib lint Logger.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Logger'
  s.version          = '1.0.0'
  s.summary          = 'Apple platform logger.'
  s.homepage         = "https://github.com/kapizoli77/logger"

  s.description      = "Universal logging utility for Apple platforms."
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Zoltan Kapi' => 'kapi.zoli77@gmail.com' }
  s.source           = { :git => "https://github.com/kapizoli77/logger.git", :tag => "#{s.version}" }

  s.ios.deployment_target = '10.0'

  s.swift_version = '5.0'

  s.source_files = 'Logger/Classes/**/*'
  s.dependency 'Alamofire', '~> 4.8.2'
end
