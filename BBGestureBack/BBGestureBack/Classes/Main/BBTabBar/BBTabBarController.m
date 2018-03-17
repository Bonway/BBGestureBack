//
//  BBTabBarController.m
//  BBGestureBack
//
//  Created by user on 2018/3/17.
//  Copyright © 2018年 Bonway. All rights reserved.
//

#import "BBTabBarController.h"

#import "BBNavigationController.h"

#import "HomeViewController.h"
#import "UserViewController.h"

@interface BBTabBarController ()

@end

@implementation BBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpAllChildViewController];
}


- (void)setUpAllChildViewController {
    HomeViewController *home = [[HomeViewController alloc] init];
    [self setUpOneChildViewController:home image:[UIImage imageNamed:@"TabBarHomeNormal"] selectedImage:[UIImage imageNamed:@"TabBarHomeSelected"] title:@"主页"];
    
    UserViewController *user = [[UserViewController alloc] init];
    [self setUpOneChildViewController:user image:[UIImage imageNamed:@"TabBarUserNormal"] selectedImage:[UIImage imageNamed:@"TabBarUserSelected"] title:@"我的"];
}


/**
 *  设置每个子控制器的相关信息
 *
 *  @param vc            控制器
 *  @param image         未选中的图片
 *  @param selectedImage 选中的图片
 *  @param title         标题
 */
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title {
    vc.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    BBNavigationController *nav = [[BBNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
