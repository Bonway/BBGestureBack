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

UIKIT_EXTERN const CGFloat BBDistanceToLeft;
UIKIT_EXTERN const CGFloat BBWindowToScale;
UIKIT_EXTERN const CGFloat BBMaskingAlpha;
UIKIT_EXTERN const CGFloat BBGestureSpeed;
UIKIT_EXTERN const CGFloat BBDistanceToPan;
