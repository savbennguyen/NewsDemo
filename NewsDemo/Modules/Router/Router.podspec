Pod::Spec.new do |s|
  s.name             = 'Router'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Router.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/BenNguyen/Router'
  s.author           = { 'BenNguyen' => '' }
  s.source           = { :git => 'https://github.com/BenNguyen/Router.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.source_files = 'Router/Classes/**/*'
  s.dependency 'Core'
  s.dependency 'News'
end
