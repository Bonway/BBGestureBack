# BBGestureBack

Full screen return gesture（全屏手势返回 滑动返回 pop 动画效果）

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

![BBGestureBack.gif](https://upload-images.jianshu.io/upload_images/10991770-edecbec93d1d7e8b.gif?imageMogr2/auto-orient/strip)


####  BBGestureBack如何使用？ ####
按照Demo集成就可以了，注意：

 * 是否使用效果
 
 `@property (nonatomic) Boolean isEnablePanGesture;//default is YES.`
 
 * pop的返回方式
```
 - (void)bb_popViewController;
 - (void)bb_popToViewController:(UIViewController*)viewController;
 - (void)bb_popToRootViewController;
```
* 参数

```
* 参数 oc
![oc参数说明及文件目录](https://img-blog.csdn.net/20180815165145281?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0JvbndheV9IdWFuZw==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
```
UIKIT_EXTERN const Boolean BBIsCanleSystemPan;//是否屏蔽系统返回手势
UIKIT_EXTERN const CGFloat BBDistanceToLeft;//距离左边响应的范围
UIKIT_EXTERN const CGFloat BBWindowToScale;//缩放大小(淘宝、京东没有缩放...)
UIKIT_EXTERN const CGFloat BBMaskingAlpha;//背景透明度
UIKIT_EXTERN const CGFloat BBGestureSpeed;//返回的速度
UIKIT_EXTERN const CGFloat BBDistanceToPan;//手势拖拽的长度
UIKIT_EXTERN const CGFloat BBDistanceToStart;//默认为0，0为全屏返回，也可指定距离
```
* 参数 swift
![swift参数说明及文件目录](https://img-blog.csdn.net/20180815165243642?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0JvbndheV9IdWFuZw==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
```
let BBIsCanleSystemPan:Bool = true//是否屏蔽系统返回手势
let BBDistanceToLeft:CGFloat! = 70.0//距离左边响应的范围
let BBWindowToScale:CGFloat! = 0.95//缩放大小(淘宝、京东没有缩放...)
let BBMaskingAlpha:CGFloat! = 0.9//背景透明度
let BBGestureSpeed:TimeInterval! = 0.3//返回的速度
let BBDistanceToPan:CGFloat! = 10//手势拖拽的长度
let BBDistanceToStart:CGFloat! = 100//默认为0，0为全屏返回，也可指定距离
```
上传图片说明：
![参数说明.png](https://upload-images.jianshu.io/upload_images/10991770-1043942d2a253495.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

####  BBGestureBack 系统全屏效果 ####
![系统全屏返回.gif](https://upload-images.jianshu.io/upload_images/10991770-40fc8f74b89dff82.gif?imageMogr2/auto-orient/strip)


####  BBGestureBack点赞及下载 ####
[别拦我，我要去点赞下载](https://github.com/Bonway/BBGestureBack)
