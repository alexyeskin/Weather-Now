platform :ios, '13.0'

use_frameworks!
inhibit_all_warnings!

def swinject_pods
    pod 'Swinject', '2.5.0'
end

def helpers_pods
    pod 'R.swift', '5.0.0'
    pod 'Alamofire', '~> 5.2'
    pod 'SnapKit', '~> 5.0.0'
end

target 'Weather Now' do
        
    swinject_pods
    helpers_pods
    
end

post_install do |installer|
  installer.pods_project.root_object.attributes['LastSwiftMigration'] = 9999
  installer.pods_project.root_object.attributes['LastSwiftUpdateCheck'] = 9999
  installer.pods_project.root_object.attributes['LastUpgradeCheck'] = 9999
end
