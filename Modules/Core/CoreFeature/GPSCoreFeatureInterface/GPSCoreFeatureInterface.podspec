Pod::Spec.new do |s|
  s.name             = 'GPSCoreFeatureInterface'
  s.version          = '1.0.0'
  s.summary          = 'A short description of GPSCoreFeatureInterface.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/GilsonPSantos'
  s.authors          = { 'GilsonSantos' => 'gilsonsantosti@gmail.com'}
  s.source           = { :git => 'https://github.com/GilsonPSantos/template-module.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.subspec 'CoordinatorInterface' do |coordinatorInterface|
    coordinatorInterface.source_files = 'Coordinator/Sources/**/*'
  end
end
