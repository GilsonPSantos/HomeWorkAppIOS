Pod::Spec.new do |s|
  s.name             = 'GPSCoordinator'
  s.version          = '1.0.0'
  s.summary          = 'A short description of GPSCoordinator.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/GilsonPSantos'
  s.authors          = { 'GilsonSantos' => 'gilsonsantosti@gmail.com'}
  s.source           = { :git => 'https://github.com/GilsonPSantos/template-module.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'Sources/**/*'
  s.resource_bundles = {
    'GPSCoordinator' => [ "Resources/Assets/*.xcassets",
                       "Resources/Strings/*.strings" ]
  }

  s.dependency 'GPSCoordinatorInterface'

  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Tests/**/*.swift'
  end
end
