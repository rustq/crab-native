Pod::Spec.new do |s|
    s.name             = 'CrabNative'
    s.version          = '0.1.0'
    s.summary          = 'Declarative UIView construction toolkit for Objective-C'
    s.homepage         = 'https://github.com/rustq/crab_native'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'MeloAlright' => 'meloalright@gmail.com' }
    s.source           = { :git => 'https://github.com/rustq/crab_native.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '15.0'
    s.source_files = 'CrabNative/**/*'
    s.public_header_files = 'CrabNative/**/*.h'
  end