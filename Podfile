# Uncomment the next line to define a global platform for your project
platform :ios, '14.5'

def external_pods 
  pod  'SwiftLint'
  pod 'SwiftGen', '~> 6.0'
end

target 'HomeWorkApp' do
  use_frameworks!
  external_pods
  
  target 'HomeWorkAppTests' do
    inherit! :search_paths
    
  end

  target 'HomeWorkAppUITests' do
    # Pods for testing
  end
end
