//
//  AppDelegate.m
//  Gesture
//
//  Created by 袁斌 on 15/11/6.
//  Copyright © 2015年 yinbanke. All rights reserved.
//

#import "AppDelegate.h"
#import "GestureViewController.h"
#import "GestureSettingViewController.h"
#import "PasswordAccount.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    if ([PasswordAccount isOnWithNeedPassword] == NO) {
        [self root];
    }else{
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(root) name:@"root" object:nil];
        GestureViewController *ges = [[GestureViewController alloc] initWithCaseMode:VerifyMode];
        [PasswordAccount needPasswordIsOn:YES];
        ges.isFormer = YES;
        self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:ges];
    }
    return YES;
}
-(void)root
{
    GestureSettingViewController *sett = [[GestureSettingViewController alloc] initWithStyle:UITableViewStyleGrouped];
    NSString *pa = [PasswordAccount password];
    NSLog(@"-----%@",pa);
    sett.isSetting = [PasswordAccount isOnWithNeedPassword];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:sett];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com