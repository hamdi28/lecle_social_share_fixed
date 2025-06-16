Pod::Spec.new do |s|
  s.name             = 'lecle_social_share'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter project support share data to social media (Facebook, Instagram, etc.)'
  s.description      = <<-DESC
                        A Flutter project support share data to social media (Facebook, Instagram, etc.)
                      DESC
  s.homepage         = 'http://lecle.vn'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
 
  s.dependency 'Flutter'
  s.dependency 'FBSDKCoreKit', '16.2.1'
  s.dependency 'FBSDKShareKit', '16.2.1'
  s.dependency 'TwitterKit5', '5.2.0'
 
  s.platform = :ios, '11.0'
  s.static_framework = true
 
  excluded_archs = 'i386 arm64'
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => excluded_archs
  }
  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => excluded_archs
  }
 
  s.swift_version = '5.0'
 
  # 👇 Automatically download TikTokOpenSDK.xcframework on pod install
  s.prepare_command = <<-CMD
    curl -L -o TikTokOpenSDK.zip https://sf16-va.tiktokcdn.com/obj/tiktok-open-platform/TikTokOpenSDK.xcframework-5.0.15.zip
    rm -rf TikTokOpenSDK
    unzip -o TikTokOpenSDK.zip -d TikTokOpenSDK
    rm TikTokOpenSDK.zip
  CMD
 
  # 👇 Reference the extracted framework
  s.vendored_frameworks = 'TikTokOpenSDK/TikTokOpenSDK.xcframework'
end