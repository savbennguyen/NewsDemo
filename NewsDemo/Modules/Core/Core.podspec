Pod::Spec.new do |s|
  s.name             = 'Core'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Core.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/BenNguyen/Core'
  s.author           = { 'BenNguyen' => '' }
  s.source           = { :git => 'https://github.com/BenNguyen/Core.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.source_files = 'Core/Classes/**/*'
end
