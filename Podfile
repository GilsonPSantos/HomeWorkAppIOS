# Uncomment the next line to define a global platform for your project
platform :ios, '14.5'

# plugin 'cocoapods-keys', {
#   :project => "HomeWorkApp",
#   :keys => [
#     "ApiKey"
#   ]}

$modules_path = 'Modules/'
$core_path = $modules_path + 'Core/'
$features_path = $modules_path + 'Features/'
$service_path = $modules_path + 'Services/'

def external_pods 
  pod 'Cartography'
  pod 'Kingfisher', '5.7.0'
  pod 'SwiftGen', '6.4.0'
  pod 'SwiftLint'
  pod 'lottie-ios', '3.1.5'
end

def features
  pod 'GPSTabBar', :path => $features_path + 'GPSTabBar'
  pod 'GPSHome', :path => $features_path + 'GPSHome'
end

def core
  pod 'GPSUI', :path => $core_path + 'UI/GPSUI'
end

def core_feature_interface
  pod 'GPSCoreFeatureInterface', :path => $core_path + 'CoreFeature/GPSCoreFeatureInterface'
  pod 'GPSCoreFeatureInterface', :path => $core_path + 'CoreFeature/GPSCoreFeatureInterface'
end

def core_feature
  pod 'GPSCoreFeature', :path => $core_path + 'CoreFeature/GPSCoreFeature'
end

def service
  pod 'GPSExtensions', :path => $service_path + 'GPSExtensions'
end

def features_testspec
  pod 'GPSTabBar', :path => $features_path + 'GPSTabBar', :testspecs => ['Tests']
  pod 'GPSHome', :path => $features_path + 'GPSHome', :testspecs => ['Tests']
end

def core_feature_testspec
  pod 'GPSCoreFeature', :path => $core_path + 'CoreFeature/GPSCoreFeature', :testspecs => ['Tests']
end
  
target 'HomeWorkApp' do
  use_frameworks!
  external_pods
  features
  core
  core_feature_interface
  core_feature
  service
  
  target 'HomeWorkAppTests' do
    inherit! :search_paths
    features_testspec
    core_feature_testspec

  end

  target 'HomeWorkAppUITests' do
    inherit! :search_paths

  end
end
