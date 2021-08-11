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

def core_interface
  pod 'GPSCoordinatorInterface', :path => $core_path + 'Coordinator/GPSCoordinatorInterface'
end

def core
  pod 'GPSCoordinator', :path => $core_path + 'Coordinator/GPSCoordinator'
end

def core_testspec
  pod 'GPSCoordinator', :path => $core_path + 'Coordinator/GPSCoordinator', :testspecs => ['Tests']
end

def service
  pod 'GPSExtensions', :path => $service_path + 'GPSExtensions'
end
  
target 'HomeWorkApp' do
  use_frameworks!
  external_pods
  core_interface
  core
  service
  
  target 'HomeWorkAppTests' do
    inherit! :search_paths
    core_testspec

  end

  target 'HomeWorkAppUITests' do
    inherit! :search_paths

  end
end
