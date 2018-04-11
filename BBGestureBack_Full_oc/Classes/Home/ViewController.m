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
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"BBPop" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(popClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *sysBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 250, 100, 100)];
    sysBtn.backgroundColor = [UIColor blueColor];
    [sysBtn setTitle:@"sysPop" forState:UIControlStateNormal];
    [sysBtn addTarget:self action:@selector(sysPopClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sysBtn];
}

-(void)popClick{
    [self bb_popViewController:self.navigationController];
}
-(void)sysPopClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)dealloc{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
