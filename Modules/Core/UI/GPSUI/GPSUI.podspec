Pod::Spec.new do |s|
  s.name             = 'GPSUI'
  s.version          = '1.0.0'
  s.summary          = 'A short description of GPSUI.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/GilsonPSantos'
  s.authors          = { 'GilsonSantos' => 'gilsonsantosti@gmail.com'}
  s.source           = { :git => 'https://github.com/GilsonPSantos/template-module.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'Sources/**/*'

  s.dependency 'GPSExtensions'

  s.resource_bundles = {
    'GPSUI' => [ "Resources/Assets/*.xcassets",
                "Resources/Strings/*.strings",
                "Resources/Json/*.json"]
  }

  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Tests/**/*.swift'
  end
end
