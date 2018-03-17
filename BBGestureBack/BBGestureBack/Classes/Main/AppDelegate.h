//
//  AppDelegate.h
//  BBGestureBack
//
//  Created by user on 2018/3/17.
//  Copyright © 2018年 Bonway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBGestureBaseController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) ScreenShotView *screenshotView;
@property (strong, nonatomic) UIWindow *window;
+ (AppDelegate* )shareAppDelegate;

@end

