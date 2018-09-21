//  希望您的举手之劳，能为我点颗赞，谢谢~
//  代码地址: https://github.com/Bonway/BBGestureBack
//  BBGestureBack
//  Created by Bonway on 2016/3/17.
//  Copyright © 2016年 Bonway. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <objc/message.h>

#ifdef DEBUG
#define BBLog(...) NSLog(__VA_ARGS__)
#else
#define BBLog(...)
#endif

#define BBWeakSelf __weak typeof(self) weakSelf = self;

#define BBDeprecated(instead) NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, instead)

#define BBObjectMsgSend(...) ((void (*)(void *, SEL, UIView *))objc_msgSend)(__VA_ARGS__)
#define BBObjectMsgTarget(target) (__bridge void *)(target)

#define BBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]



// Screen system to return gesture.（是否屏蔽系统返回手势）
UIKIT_EXTERN const Boolean BBIsCanleSystemPan;
// The distance from the left can be automatically returned.(距离左边多少距离，可以自动返回)
UIKIT_EXTERN const CGFloat BBDistanceToLeft;
// BottomView Scaling.(底层缩放比例)
UIKIT_EXTERN const CGFloat BBWindowToScale;
// BottomView alpha.(底层透明度)
UIKIT_EXTERN const CGFloat BBMaskingAlpha;
// Automatic return speed.(自动返回速度)
UIKIT_EXTERN const CGFloat BBGestureSpeed;
// Range of drag and drop.(拖拽的范围,大于此值才有效果)
UIKIT_EXTERN const CGFloat BBDistanceToPan;
// The default is 0, 0 for full screen return, and also for distance.（默认为0，0为全屏返回，也可指定距离）
UIKIT_EXTERN const CGFloat BBDistanceToStart;
