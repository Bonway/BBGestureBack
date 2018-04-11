//  代码地址: https://github.com/Bonway/BBGestureBack
//  BBGestureBack
//  Created by Bonway on 2016/3/17.
//  Copyright © 2016年 Bonway. All rights reserved.
//


#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 150, 50)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"BBPop" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(popClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *BBPopToViewBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 150, 50)];
    BBPopToViewBtn.backgroundColor = [UIColor redColor];
    [BBPopToViewBtn setTitle:@"BBPopToVC" forState:UIControlStateNormal];
    [BBPopToViewBtn addTarget:self action:@selector(popToClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:BBPopToViewBtn];
    
    UIButton *BBPopToRootBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 150, 50)];
    BBPopToRootBtn.backgroundColor = [UIColor redColor];
    [BBPopToRootBtn setTitle:@"BBPopToRootVC" forState:UIControlStateNormal];
    [BBPopToRootBtn addTarget:self action:@selector(popToRootClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:BBPopToRootBtn];
    
    UIButton *sysBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 400, 150, 50)];
    sysBtn.backgroundColor = [UIColor blueColor];
    [sysBtn setTitle:@"sysPop" forState:UIControlStateNormal];
    [sysBtn addTarget:self action:@selector(sysPopClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sysBtn];
    
    
}



-(void)popClick{
    [self bb_popViewController];
}

-(void)popToClick{
    UIViewController *viewController = self.navigationController.viewControllers[0];
    [self bb_popToViewController:viewController];
}

-(void)popToRootClick{
    [self bb_popToRootViewController];
}

-(void)sysPopClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
