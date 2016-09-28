# Uncomment this line to define a global platform for your project
platform :ios, '9.0'

target 'swift-pushupprotocols' do
  use_frameworks!

  # Pods for swift-pushupprotocols

  target 'swift-pushupprotocolsTests' do
    inherit! :search_paths
   pod 'Nimble', git: 'https://github.com/Quick/Nimble.git'
pod 'Quick', git: 'https://github.com/Quick/Quick.git'
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
