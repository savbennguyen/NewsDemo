Pod::Spec.new do |s|
  s.name             = 'Const'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Const.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/BenNguyen/Const'
  s.author           = { 'BenNguyen' => '' }
  s.source           = { :git => 'https://github.com/BenNguyen/Const.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.source_files = 'Const/Classes/**/*'
end
