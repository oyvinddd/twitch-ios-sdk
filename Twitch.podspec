#
# Be sure to run `pod lib lint Twitch.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Twitch'
  s.version          = '1.0.0'
  s.summary          = 'Native Swift wrapper for the official Twitch API'
  s.description      = <<-DESC
  'This SDK wraps all the services available at https://dev.twitch.tv/docs/api.'
                       DESC

  s.homepage                = 'https://github.com/oyvinddd/twitch-ios-sdk'
  s.license                 = { :type => 'MIT', :file => 'LICENSE' }
  s.author                  = { 'Øyvind Hauge' => 'oyvind.s.hauge@gmail.com' }
  s.source                  = { :git => 'https://github.com/oyvinddd/twitch-ios-sdk', :tag => s.version.to_s }
  s.ios.deployment_target   = '12.0'
  s.source_files            = 'Source/**/*'
  s.swift_version           = '5.0'
end
