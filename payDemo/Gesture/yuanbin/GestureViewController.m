//
//  GestureViewController.m
//  Gesture
//
//  Created by 袁斌 on 15/11/7.
//  Copyright © 2015年 yinbanke. All rights reserved.
//

#import "GestureViewController.h"
#import "PasswordButton.h"
#import "PasswordAccount.h"

@interface GestureViewController ()<caseDelegate>
{
    NSMutableArray *buttonArray;
    GestureView *tentacleView;
    CaseMode _style;
    
    UILabel *tipLbel;
}

@end

@implementation GestureViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"isSettingNotice" object:nil];

}
-(instancetype)initWithCaseMode:(CaseMode)caseMode
{
    if (self = [super init]) {
        _style = caseMode;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeTop];
    [self makeUI];
}
-(void)makeTop
{
    tipLbel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 150, (self.view.frame.size.height/2-80) / 2 - 20, 300, 40)];
    tipLbel.backgroundColor = [UIColor clearColor];
    
    switch (_style) {
        case VerifyMode: {
            if (_isFormer == YES) {
                self.title = @"请输入原密码";
            }else{
                self.title = @"验证手势密码";
            }
            break;
        }
        case ResetMode: {
            
                self.title = @"设置手势密码";

            break;
        }
        default: {
            break;
        }
    }

    tipLbel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:tipLbel];
    
}
-(void)makeUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    buttonArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    CGRect frame = self.view.frame;
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(frame.size.width/2-160, frame.size.height/2-80, 320, 320)];
    for (int i=0; i<9; i++) {
        NSInteger row = i/3;
        NSInteger col = i%3;
        // Button Frame
        NSInteger distance = 320/3;
        NSInteger size = distance/1.5;
        NSInteger margin = size/4;
        PasswordButton *gesturePasswordButton = [[PasswordButton alloc]initWithFrame:CGRectMake(col*distance+margin, row*distance, size, size)];
        [gesturePasswordButton setTag:i];
        [view addSubview:gesturePasswordButton];
        [buttonArray addObject:gesturePasswordButton];
    }
    frame.origin.y=0;
    [self.view addSubview:view];
    tentacleView = [[GestureView alloc] initWithFrame:view.frame];
    tentacleView.style = _style;
    [tentacleView setButtonArray:buttonArray];
    tentacleView.caseDelegate = self;
    [self.view addSubview:tentacleView];
    

}
#pragma mark - setTouchBeginDelegate
-(BOOL)verification:(NSString *)result
{
    NSString *password = [PasswordAccount password];
    
    if ([result isEqualToString:password] == YES) {
        
        
        if ([PasswordAccount isOnWithNeedPassword] == YES) {
            
            if (_isFormer == YES) {
                [PasswordAccount needPasswordIsOn:NO];
                [self pop];
            }else{
                
                static  int i = 0;
                [PasswordAccount needPasswordIsOn:YES];
                if (i == 0) {
                    i = 1;
                    [PasswordAccount deletePassword];
                    GestureViewController *ges = [[GestureViewController alloc] initWithCaseMode:ResetMode];
                    ges.isFormer = NO;
                [self.navigationController pushViewController:ges animated:YES];
                }else{
                    i = 0;
                    [self pop];
                }
                
            }

        }else{
            
            [PasswordAccount needPasswordIsOn:YES];
            [self pop];
        }
        [self succesLable];
        return YES;
    }else{
        [self errorLable];
        return NO;
    }
}
-(void)pop
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"isSettingNotice" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"root" object:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(BOOL)resetPassword:(NSString *)result
{
    [PasswordAccount setPassword:result];
    GestureViewController *ges = [[GestureViewController alloc] initWithCaseMode:VerifyMode];
    ges.isFormer = NO;
    [self.navigationController pushViewController:ges animated:YES];
    
    return YES;
}

-(void)errorLable
{
    tipLbel.text = @"与上次密码不一致";
    tipLbel.textColor = [UIColor redColor];
}

-(void)succesLable
{
    tipLbel.text = @"验证成功";
    tipLbel.textColor = [UIColor blackColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com