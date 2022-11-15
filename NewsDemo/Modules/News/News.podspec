Pod::Spec.new do |s|
  s.name             = 'News'
  s.version          = '0.1.0'
  s.summary          = 'A short description of News.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/BenNguyen/News'
  s.author           = { 'BenNguyen' => '' }
  s.source           = { :git => 'https://github.com/BenNguyen/News.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.source_files = 'News/**/**/*.{xib,swift,h,m}'
  s.resources = 'News/Assets/*.{png,json,xcassets}'
  s.resource_bundles = {
      'News' => ['News/Assets/**/*.{png,xcassets,json,txt,storyboard,xib,xcdatamodeld,strings}']
  }
  
  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'News/Tests/**/*.{xib,swift,h,m}'
  end

  s.weak_framework = 'libswiftXCTest'
  s.weak_framework = 'XCTest'
  s.dependency 'Util'
  s.dependency 'CoreUI'
  s.dependency 'Core'
  s.dependency 'Reusable'
  s.dependency 'SkeletonView'
  s.dependency 'Reusable'
  s.dependency 'SDWebImage', '~> 5.0'
end
