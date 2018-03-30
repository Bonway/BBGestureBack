//  代码地址: https://github.com/Bonway/BBGestureBack
//  BBGestureBack
//  Created by Bonway on 2016/3/17.
//  Copyright © 2016年 Bonway. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "BBGestureBaseController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) BBScreenShotView *screenshotView;
@property (strong, nonatomic) UIWindow *window;
+ (AppDelegate* )shareAppDelegate;

@end

