
Pod::Spec.new do |s|


s.name         = "UITextViewPlaceholders"
s.version      = "0.0.1"
s.summary      = "UItextView的category"

s.description  = <<-DESC
UItextView关于Placeholder的category
DESC

s.homepage     = "https://github.com/gaozm0509/UITextViewPlaceholders"


s.license      = "MIT"

s.author       = { "高泽民" => "18036396675@163.com" }

s.source       = { :git => "https://github.com/gaozm0509/UITextViewPlaceholders.git", :tag => "0.0.1" }


s.source_files  = "UITextViewPlaceholders/Classes/*.{h,m}"

s.platform     = :ios,'5.0'

s.framework    = "UIKit"

s.requires_arc = true

end
