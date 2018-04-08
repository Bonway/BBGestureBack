//  代码地址: https://github.com/Bonway/BBGestureBack
//  BBGestureBack
//  Created by Bonway on 2016/3/17.
//  Copyright © 2016年 Bonway. All rights reserved.
//


#import "HomeViewController.h"
#import "ViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(pushClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)pushClick{
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
