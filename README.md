# BBGestureBack
Full screen return gesture
### BBGestureBack ###


####  这种手势主流App ####

[github：BBGestureBack下载](https://github.com/Bonway/BBGestureBack) 

![淘宝效果](https://img-blog.csdn.net/20180412233944808?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0JvbndheV9IdWFuZw==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
![京东效果](https://img-blog.csdn.net/20180412234031564?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0JvbndheV9IdWFuZw==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
![腾讯效果](https://img-blog.csdn.net/20180412234056306?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0JvbndheV9IdWFuZw==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
![斗鱼效果](https://img-blog.csdn.net/20180412234125452?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L0JvbndheV9IdWFuZw==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)


####  支持OC、Swift ####
BBGestureBack不仅支持OC还支持Swift，iOS主流的手势返回、滑动返回、pop动画效果都有，适配各种iPhone，嵌入简单，只需按照Demo集成，就能完美使用。（集成最简单、功能最全面）

![支持OC、Swift](http://img.blog.csdn.net/20180412140705152?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvQm9ud2F5X0h1YW5n/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

####  BBGestureBack手势效果 ####
不仅仅手势返回可以有动画、就连pop也有效果。

![BBGestureBack手势效果](http://img.blog.csdn.net/20180412135625470?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvQm9ud2F5X0h1YW5n/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

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
UIKIT_EXTERN const CGFloat BBDistanceToLeft;//距离左边响应的范围
UIKIT_EXTERN const CGFloat BBWindowToScale;//缩放大小
UIKIT_EXTERN const CGFloat BBMaskingAlpha;//背景透明度
UIKIT_EXTERN const CGFloat BBGestureSpeed;//返回的速度
UIKIT_EXTERN const CGFloat BBDistanceToPan;//手势拖拽的长度
```
上传图片说明：
![BBGestureBack参数说明](http://img.blog.csdn.net/20180412143951852?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvQm9ud2F5X0h1YW5n/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

####  BBGestureBack下载 ####
[传送门](https://github.com/Bonway/BBGestureBack)
