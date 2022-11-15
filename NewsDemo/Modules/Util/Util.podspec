Pod::Spec.new do |s|
  s.name             = 'Util'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Util.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/BenNguyen/Util'
  s.author           = { 'BenNguyen' => '' }
  s.source           = { :git => 'https://github.com/BenNguyen/Util.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.source_files = 'Util/**/**/*'
  
  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Util/**/**/*'
  end

  s.weak_framework = 'libswiftXCTest'
  s.weak_framework = 'XCTest'
  s.dependency 'Alamofire', '~> 4.7'
  s.dependency 'Const'
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
end
