#YPUIKit.podspec
Pod::Spec.new do |s|
s.name         = "YPUIKit"
s.version      = "1.0.0"
s.summary      = "A collection of categories that contains many commonly used methods."

s.homepage     = "https://github.com/yuping1989/YPUIKit"
s.license      = 'MIT'
s.author       = { "Yu Ping" => "290180695@qq.com" }
s.platform     = :ios, "7.0"
s.ios.deployment_target = "7.0"
s.source       = { :git => "https://github.com/yuping1989/YPUIKit.git", :tag => s.version}
s.source_files  = 'YPUIKit/**/*.{h,m}'
s.requires_arc = true
s.dependency 'MBProgressHUD', '1.1.0'
end
