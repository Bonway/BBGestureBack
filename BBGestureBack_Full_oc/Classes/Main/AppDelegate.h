//  希望您的举手之劳，能为我点颗赞，谢谢~
//  代码地址: https://github.com/Bonway/BBGestureBack
//  BBGestureBack
//  Created by Bonway on 2016/3/17.
//  Copyright © 2016年 Bonway. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "BBGestureBaseController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) BBGestureBaseView *gestureBaseView;
@property (strong, nonatomic) UIWindow *window;
+ (AppDelegate* )shareAppDelegate;

- (void)setupRootViewController:(UIViewController *)rootViewController;

@end

