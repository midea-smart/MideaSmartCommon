#
# Be sure to run `pod lib lint MideaSmartCommon.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MideaSmartCommon'
  s.version          = '0.1.0'
  s.summary          = '美的智慧的一些公用组建'
  s.description      = '美的智慧的一些公用组建，提高项目开发效率及项目质量'
  s.homepage         = 'https://github.com/midea-smart'
   s.screenshots     = 'http://www.lgstatic.com/thumbnail_300x300/image1/M00/21/E6/CgYXBlU--F2AcMEOAABoYyINKNk984.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'denglibing' => 'libing.deng@midea.com' }
  s.source           = { :git => 'https://github.com/midea-smart/MideaSmartCommon.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

  
  s.subspec 'MSTableViewCommon' do |MSTVC|
      MSTVC.source_files = 'MideaSmartCommon/Classes/FDDBaseRepo/*.{h,m}'
  end
      
  
  # s.resource_bundles = {
  #   'MideaSmartCommon' => ['MideaSmartCommon/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
