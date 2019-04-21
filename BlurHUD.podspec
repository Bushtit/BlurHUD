Pod::Spec.new do |s|
  s.name                      = 'BlurHUD'
  s.module_name               = 'BlurHUD'
  s.version                   = '1.1.0'
  s.summary                   = 'An re-implementation of the Apple\'s HUD.'
  s.homepage                  = 'https://github.com/Bushtit/BlurHUD'
  s.license                   = 'MIT'
  s.author                    = { 'Elias Abel' => 'admin@meniny.cn' }
  s.platform                  = :ios, '8.0'
  s.ios.deployment_target     = '8.0'
  s.swift_version             = '5'
  s.requires_arc              = true
  s.source                    = { :git => 'https://github.com/Bushtit/BlurHUD.git', :tag => s.version.to_s }
  s.source_files              = 'BlurHUD/**/*.{h,swift}'
  s.resources                 = 'BlurHUD/*.xcassets'
end
