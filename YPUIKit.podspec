#YPUIKit.podspec
Pod::Spec.new do |s|
	s.name         = "YPUIKit"
	s.version      = "1.1.4"
	s.summary      = "A collection of categories that contains many commonly used methods."

	s.homepage     = "https://github.com/yuping1989/YPUIKit"
	s.license      = 'MIT'
	s.author       = { "Yu Ping" => "290180695@qq.com" }
	s.platform     = :ios, "8.0"
	s.ios.deployment_target = "8.0"
	s.source       = { :git => "https://github.com/yuping1989/YPUIKit.git", :tag => s.version}
	s.requires_arc = true

	s.default_subspec = 'All'

	s.subspec 'All' do |all|
		all.source_files  = 'YPUIKit/**/*.{h,m}'
		all.dependency 'MBProgressHUD'
		all.dependency 'Masonry'
	end

	s.subspec 'YPLine' do |line|
		line.source_files = 'YPUIKit/YPLine/**/*.{h,m}'
		line.dependency 'Masonry'
	end

	s.subspec 'YPProgress' do |progress|
		progress.source_files = 'YPUIKit/YPProgress/**/*.{h,m}'
		progress.dependency 'MBProgressHUD'
		progress.resources = 'YPUIKit/YPProgress/YPProgress.bundle'
	end

	s.subspec 'YPBaseUpwardsView' do |buv|
		buv.source_files = 'YPUIKit/YPBaseUpwardsView/**/*.{h,m}'
	end

	s.subspec 'YPCheckBox' do |cb|
		cb.source_files = 'YPUIKit/YPCheckBox/**/*.{h,m}'
	end

	s.subspec 'YPControl' do |control|
		control.source_files = 'YPUIKit/YPControl/**/*.{h,m}'
	end

	s.subspec 'YPPageControlView' do |pcv|
		pcv.source_files = 'YPUIKit/YPPageControlView/**/*.{h,m}'
	end

	s.subspec 'YPTagCloudView' do |tcv|
		tcv.source_files = 'YPUIKit/YPTagCloudView/**/*.{h,m}'
	end

	s.subspec 'YPTextView' do |tv|
		tv.source_files = 'YPUIKit/YPTextView/**/*.{h,m}'
	end
end
