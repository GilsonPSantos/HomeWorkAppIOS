# Uncomment the next line to define a global platform for your project
platform :ios, '14.5'

# plugin 'cocoapods-keys', {
#   :project => "HomeWorkApp",
#   :keys => [
#     "ApiKey"
#   ]}

$modules_path = 'Modules/'
$core_path = $modules_path + 'Core/'
$service_path = $modules_path + 'Services/'

def external_pods 
  pod  'SwiftLint'
  pod 'SwiftGen', '~> 6.0'
end

def core_feature_interface
  pod 'GPSCoreFeatureInterface', :path => $core_path + 'CoreFeature/GPSCoreFeatureInterface'
end

def core_feature
  pod 'GPSCoreFeature', :path => $core_path + 'CoreFeature/GPSCoreFeature'
end

def service
  pod 'GPSExtensions', :path => $service_path + 'GPSExtensions'
end

def core_feature_testspec
  pod 'GPSCoreFeature', :path => $core_path + 'CoreFeature/GPSCoreFeature', :testspecs => ['Tests']
end
  
target 'HomeWorkApp' do
  use_frameworks!
  external_pods
  core_feature_interface
  core_feature
  service
  
  target 'HomeWorkAppTests' do
    inherit! :search_paths
    core_feature_testspec

  end

  target 'HomeWorkAppUITests' do
    inherit! :search_paths

  end
end
