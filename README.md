# PopStudy
这个Demo封装了轮播图、二维码、头部滑动等一些项目里经常用到的动画功能


##新特性
- tableView的动画利用Pop框架 实现滑动和点击的特效，并具有拼音模糊搜索功能
- 二维码功能利用ZXingObjC实现二维码生成和扫描，接口都留出来了集成起来非常方便
- sliderView基于scrollView实现头部滑动视图支持文字、文字和图片两种形式，支持自定义样式
- 轮播图基于collectionView实现,可以添加图片和标题自定义了pageControl的样式，因为时间关系各种该属性接口还没留出来。
- 仿qq空间导航栏渐变效果 使用原生的navigationBar,利用scrollView的代理实现导航栏的渐变效果

##第三方用到
- Pop
- Masonry
- ZXingObjC
- LBXScan 
