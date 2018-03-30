//  代码地址: https://github.com/Bonway/BBGestureBack
//  BBGestureBack
//  Created by Bonway on 2016/3/17.
//  Copyright © 2016年 Bonway. All rights reserved.
//


#import <UIKit/UIKit.h>
// 打开边界后，放开，距离左边多少距离才触发pop
// 常量

//#define BBDistanceLeft 70

@interface BBNavigationController : UINavigationController
@property (strong ,nonatomic) NSMutableArray *arrayScreenshot;
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;
@end
