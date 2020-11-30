#
# Be sure to run `pod lib lint WebBridge.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WebBridge'
  s.version          = '1.0.0'
  s.summary          = 'A short description of WebBridge.'

  s.description      = "A short description of WebBridge."

  s.homepage         = 'https://github.com/cpson/WebBridge'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'cpson' => 'cpsony2k@gmail.com' }
  s.source           = { :git => 'https://github.com/cpson/WebBridge.git', :tag => s.version.to_s }
  s.swift_versions = ['3', '4.1', '4.2', '5.0', '5.1', '5.2', '5.3']
  s.ios.deployment_target = '11.0'

  s.source_files = 'Sources/**/*'
  
end
