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
    [self setUpOneChildViewController:home image:[UIImage imageNamed:@"TabBarHomeNormal"] selectedImage:[UIImage imageNamed:@"TabBarHomeSelected"] title:@"Home"];
    UserViewController *user = [[UserViewController alloc] init];
    [self setUpOneChildViewController:user image:[UIImage imageNamed:@"TabBarUserNormal"] selectedImage:[UIImage imageNamed:@"TabBarUserSelected"] title:@"User"];
}
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
