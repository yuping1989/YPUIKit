#YPCategory.podspec
Pod::Spec.new do |s|
s.name         = "YPCategory"
s.version      = "1.0.1"
s.summary      = "A collection of categories that contains many commonly used methods."

s.homepage     = "https://github.com/yuping1989/YPCategory"
s.license      = 'MIT'
s.author       = { "Yu Ping" => "290180695@qq.com" }
s.platform     = :ios, "7.0"
s.ios.deployment_target = "7.0"
s.source       = { :git => "https://github.com/yuping1989/YPCategory.git", :tag => s.version}
s.source_files  = 'YPCategory/YPCategory/**/*'
s.requires_arc = true
end
