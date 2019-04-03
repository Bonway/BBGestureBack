//  希望您的举手之劳，能为我点颗赞，谢谢~
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
    
    UIButton *sysBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    sysBtn.backgroundColor = [UIColor blueColor];
    [sysBtn setTitle:@"sysPush" forState:UIControlStateNormal];
    [sysBtn addTarget:self action:@selector(sysPushClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sysBtn];
    
}

-(void)sysPushClick{
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
