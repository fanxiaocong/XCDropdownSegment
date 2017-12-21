Pod::Spec.new do |s|


  s.name         = "XCDropdownSegment"
  s.version      = "0.0.1"
  s.summary      = "XCDropdownSegment."

  s.description  = <<-DESC
XCDropdownSegment，封装下拉菜单
                   DESC

  s.homepage     = "https://github.com/fanxiaocong/XCDropdownSegment"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "樊小聪" => "1016697223@qq.com" }

  s.platform     = :ios, "8.3"
  s.source       = { :git => "https://github.com/fanxiaocong/XCDropdownSegment.git", :tag => "#{s.version}" }


  s.source_files  = "XCDropdownSegment/*.{h,m,xib}"
  s.resource  = "XCDropdownSegment/XCDropdownSegment.bundle"
  s.requires_arc = true

end
