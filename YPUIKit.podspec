#YPUIKit.podspec
Pod::Spec.new do |s|
	s.name         = "YPUIKit"
	s.version      = "1.2.4"
	s.summary      = "A collection of categories that contains many commonly used methods."

	s.homepage     = "https://github.com/yuping1989/YPUIKit"
	s.license      = 'MIT'
	s.author       = { "Yu Ping" => "290180695@qq.com" }
	s.platform     = :ios, "8.0"
	s.ios.deployment_target = "8.0"
	s.source       = { :git => "https://github.com/yuping1989/YPUIKit.git", :tag => s.version}
	s.requires_arc = true
	s.resources	   = 'YPUIKit/Resources/YPUIKit.bundle'

	s.default_subspec = 'All'

	s.subspec 'All' do |ss|
		ss.source_files  = 'YPUIKit/**/*.{h,m}'
		ss.dependency 'MBProgressHUD'
		ss.dependency 'Masonry'
	end

	s.subspec 'YPLine' do |ss|
		ss.source_files = 'YPUIKit/YPLine/**/*.{h,m}'
		ss.dependency 'Masonry'
	end

	s.subspec 'YPProgress' do |ss|
		ss.source_files = 'YPUIKit/YPProgress/**/*.{h,m}'
		ss.dependency 'MBProgressHUD'
	end

	s.subspec 'YPBaseUpwardsView' do |ss|
		ss.source_files = 'YPUIKit/YPBaseUpwardsView/**/*.{h,m}'
	end

	s.subspec 'YPCheckBox' do |ss|
		ss.source_files = 'YPUIKit/YPCheckBox/**/*.{h,m}'
	end

	s.subspec 'YPControl' do |ss|
		ss.source_files = 'YPUIKit/YPControl/**/*.{h,m}'
	end

	s.subspec 'YPPageControlView' do |ss|
		ss.source_files = 'YPUIKit/YPPageControlView/**/*.{h,m}'
	end

	s.subspec 'YPTagCloudView' do |ss|
		ss.source_files = 'YPUIKit/YPTagCloudView/**/*.{h,m}'
	end

	s.subspec 'YPTextView' do |ss|
		ss.source_files = 'YPUIKit/YPTextView/**/*.{h,m}'
		ss.dependency 'Masonry'
	end
end
