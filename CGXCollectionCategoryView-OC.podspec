Pod::Spec.new do |s|
s.name         = "CGXCollectionCategoryView-OC"    #存储库名称
s.version      = "1.4.0"      #版本号，与tag值一致
s.summary      = "UICollectionView封装列表库"  #简介
s.description  = "常用UICollectionView控件列表封装,瀑布流布局使用,多行展示"  #描述
s.homepage     = "https://github.com/974794055/CGXCollectionCategoryView-OC"      #项目主页，不是git地址
s.license      = { :type => "MIT", :file => "LICENSE" }   #开源协议
s.author             = { "974794055" => "974794055@qq.com" }  #作者
s.platform     = :ios, "8.0"                  #支持的平台和版本号
s.source       = { :git => "https://github.com/974794055/CGXCollectionCategoryView-OC.git", :tag => s.version }         #存储库的git地址，以及tag值
s.requires_arc = true #是否支持ARC
s.frameworks = 'UIKit'

#s.source_files  =  "CGXCollectionCategoryView", "CGXCollectionCategoryView/**/*.{h,m}" 
#需要托管的源代码路径


#需要托管的源代码路径
s.source_files = 'CGXCollectionCategoryView/CGXCollectionCategoryView.h'

#开源库头文件
s.public_header_files = 'CGXCollectionCategoryView/CGXCollectionCategoryView.h'



 s.subspec 'Common' do |ss|
    ss.source_files = 'CGXCollectionCategoryView/Common/**/*.{h,m}'

  end

 s.subspec 'BaseView' do |ss|
    ss.source_files = 'CGXCollectionCategoryView/BaseView/**/*.{h,m}','CGXCollectionCategoryView/Delegate/**/*.{h,m}'
ss.dependency 'CGXCollectionCategoryView-OC/Common'
  end


 s.subspec 'WaterView' do |ss|
    ss.source_files = 'CGXCollectionCategoryView/WaterView/**/*.{h,m}'
ss.dependency 'CGXCollectionCategoryView-OC/Common'
ss.dependency 'CGXCollectionCategoryView-OC/BaseView'
  end

 s.subspec 'GeneralView' do |ss|
    ss.source_files = 'CGXCollectionCategoryView/GeneralView/**/*.{h,m}'
ss.dependency 'CGXCollectionCategoryView-OC/Common'
ss.dependency 'CGXCollectionCategoryView-OC/BaseView'
  end


end




