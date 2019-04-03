# BBGestureBack

Full screen return gesture（全屏手势返回 滑动返回 pop 动画效果）
在此感谢大家提的建议！！！

[如果你在天朝，请点击这里，速度会很快哦~](https://blog.csdn.net/Bonway_Huang/article/details/50505975) 

## iOS 侧滑返回 ##

![BBGestureBack](https://upload-images.jianshu.io/upload_images/10991770-a719a5c2c5c01c79.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

BBGestureBack iOS 全屏手势返回 滑动返回 pop 动画效果

####  这种手势主流App ####
[我要去下载 点赞 ：BBGestureBack](https://github.com/Bonway/BBGestureBack) 

现在市场上的主流app都有用到各种侧滑手势，**大体上分为2种**，
一种是：类似于淘宝、京东、腾讯、斗鱼的效果，带导航栏的。如图：

![淘宝效果.gif](https://upload-images.jianshu.io/upload_images/10991770-c0c066b9952cd4a2.gif?imageMogr2/auto-orient/strip)
![京东效果.gif](https://upload-images.jianshu.io/upload_images/10991770-20665acc596753fd.gif?imageMogr2/auto-orient/strip)
![腾讯效果.gif](https://upload-images.jianshu.io/upload_images/10991770-85ee3a14c08af52f.gif?imageMogr2/auto-orient/strip)
![斗鱼效果.gif](https://upload-images.jianshu.io/upload_images/10991770-a807f552c60ef11b.gif?imageMogr2/auto-orient/strip)


一种是：类似于微信，不带导航栏，如图：

![微信效果.gif](https://upload-images.jianshu.io/upload_images/10991770-85b47cf133bac792.gif?imageMogr2/auto-orient/strip)


####  支持OC、Swift：最低适配iOS 7.0 ####

BBGestureBack不仅支持OC还支持Swift，最低适配iOS7.0，iOS主流的全屏手势返回、滑动返回、pop动画效果都有，适配各种iPhone，嵌入简单，只需按照Demo集成，就能完美使用。（集成最简单、功能最全面）

![BBGestureBack Demo.jpg](https://upload-images.jianshu.io/upload_images/10991770-c04ac90bcad25482.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

####  BBGestureBack手势效果 ####

不仅仅手势返回可以有动画、就连pop也有效果。

![BBGestureBack手势效果](https://upload-images.jianshu.io/upload_images/10991770-d4ed0df184db25ca.gif?imageMogr2/auto-orient/strip)

![BBGestureBack.gif](https://upload-images.jianshu.io/upload_images/10991770-edecbec93d1d7e8b.gif?imageMogr2/auto-orient/strip)


####  BBGestureBack如何使用？ ####
按照Demo集成就可以了，注意：

 * 是否使用效果
 
 `@property (nonatomic) Boolean isEnablePanGesture;//default is YES.`
 
  * 重新设置rootViewController
  
 ` setupRootViewController:(UIViewController *)rootViewController`
 
 * pop的返回方式
 
```
 - (void)bb_popViewController;
 - (void)bb_popToViewController:(UIViewController*)viewController;
 - (void)bb_popToRootViewController;
```
* 更新增引导图，后期还会完善广告图


* 参数 oc
![oc参数说明及文件目录](https://upload-images.jianshu.io/upload_images/10991770-ab0eea71e46a62df.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
//The ifrst user guider image (第一次引导图)
UIKIT_EXTERN NSString *const kBBFirstLaunch;
// Open iPhone X Style.（是否打开Phone X风格）
UIKIT_EXTERN const Boolean kBBIsOpenIphoneXStyle;
// The default is 40， iPhone X Style Corner。（默认为40，iPhone X 圆角弧度）
UIKIT_EXTERN const CGFloat kBBIphoneXStyleCorner;
// The default is 3， User guider image count。（默认为3，用户引导图总页数）
UIKIT_EXTERN const NSInteger kBBUserGuiderImgCount;
// Screen system to return gesture.（是否屏蔽系统返回手势）
UIKIT_EXTERN const Boolean kBBIsCanleSystemPan;
// The distance from the left can be automatically returned.(距离左边多少距离，可以自动返回)
UIKIT_EXTERN const CGFloat kBBDistanceToLeft;
// BottomView Scaling.(底层缩放比例)
UIKIT_EXTERN const CGFloat kBBWindowToScale;
// BottomView alpha.(底层透明度)
UIKIT_EXTERN const CGFloat kBBMaskingAlpha;
// Automatic return speed.(自动返回速度)
UIKIT_EXTERN const CGFloat kBBGestureSpeed;
// Range of drag and drop.(拖拽的范围,大于此值才有效果)
UIKIT_EXTERN const CGFloat kBBDistanceToPan;
// The default is 0, 0 for full screen return, and also for distance.（默认为0，0为全屏返回，也可指定距离）
UIKIT_EXTERN const CGFloat kBBDistanceToStart;
```
* 参数 swift
![swift参数说明及文件目录](https://upload-images.jianshu.io/upload_images/10991770-b63eb35b54bc62fd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```
//The ifrst user guider image (第一次引导图)
let kBBFirstLaunch:String = "BBFirstLaunch"
// Open iPhone X Style.（是否打开Phone X风格）
let kBBIsOpenIphoneXStyle:Bool = true
// The default is 40， iPhone X Style Corner。（默认为40，iPhone X 圆角弧度）
let kBBIphoneXStyleCorner:CGFloat! = 40
// The default is 3， User guider image count。（默认为3，用户引导图总页数）
let kBBUserGuiderImgCount:Int = 3
// Screen system to return gesture.（是否屏蔽系统返回手势）
let kBBIsCanleSystemPan:Bool = true
// The distance from the left can be automatically returned.(距离左边多少距离，可以自动返回)
let kBBDistanceToLeft:CGFloat! = 70.0
// BottomView Scaling.(底层缩放比例)
let kBBWindowToScale:CGFloat! = 0.95
// BottomView alpha.(底层透明度)
let kBBMaskingAlpha:CGFloat! = 0.9
// Automatic return speed.(自动返回速度)
let kBBGestureSpeed:TimeInterval! = 0.3
// Range of drag and drop.(拖拽的范围,大于此值才有效果)
let kBBDistanceToPan:CGFloat! = 10
// The default is 0, 0 for full screen return, and also for distance.（默认为0，0为全屏返回，也可指定距离）
let kBBDistanceToStart:CGFloat! = 100
```

上传图片说明：
![BBGestureBack参数说明](https://upload-images.jianshu.io/upload_images/10991770-190ae7dbcf35d5e7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

####  BBGestureBack 系统全屏效果 ####
![系统全屏返回.gif](https://upload-images.jianshu.io/upload_images/10991770-40fc8f74b89dff82.gif?imageMogr2/auto-orient/strip)


####  BBGestureBack点赞及下载 ####
[别拦我，我要去点赞下载](https://github.com/Bonway/BBGestureBack)
