//
//  PasswordAccount.m
//  Gesture
//
//  Created by 袁斌 on 15/11/8.
//  Copyright © 2015年 yinbanke. All rights reserved.
//

#import "PasswordAccount.h"

#define kPassword @"kPassword"
#define kNeedPassword @"kNeedPassword"
#define kShowTrack  @"kShowTrack"

@implementation PasswordAccount

+(void)setPassword:(NSString *)password
{
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:kPassword];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *)password
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:kPassword];
}
+(void)deletePassword
{
    
    [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:kPassword];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(void)needPasswordIsOn:(BOOL)isOn
{
    [[NSUserDefaults standardUserDefaults] setBool:isOn forKey:kNeedPassword];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

+(BOOL)isOnWithNeedPassword
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kNeedPassword];
}

+(void)showTrackIsOn:(BOOL)isOn
{
    [[NSUserDefaults standardUserDefaults] setBool:isOn forKey:kShowTrack];
    [[NSUserDefaults standardUserDefaults] synchronize];

}
+(BOOL)isOnWithShowTrack
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kShowTrack];

}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com