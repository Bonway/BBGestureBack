//  希望您的举手之劳，能为我点颗赞，谢谢~
//  代码地址: https://github.com/Bonway/BBGestureBack
//  BBGestureBack
//  Created by Bonway on 2016/3/17.
//  Copyright © 2016年 Bonway. All rights reserved.
//

#import "BBUserGuiderController.h"
#import "AppDelegate.h"
#import "BBGestureBack.h"
@interface BBUserGuiderController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView  *userGuiderScrollView;
@property (nonatomic,strong)UIButton  *startBtn;
@property (nonatomic,weak)UIImageView   *userGuiderImgView;

@end

@implementation BBUserGuiderController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.userGuiderScrollView];
}

- (UIScrollView *)userGuiderScrollView{
    if (!_userGuiderScrollView) {
        _userGuiderScrollView=[[UIScrollView  alloc] initWithFrame:self.view.bounds];
        
        NSString *fileStr = [[NSBundle mainBundle] pathForResource:@"BBUserGuider" ofType:@"bundle"];
        NSBundle *imageBundle=[NSBundle bundleWithPath:fileStr];
        
        for (int i=0; i<kBBUserGuiderImgCount; i++) {
            UIImageView  *imageView=[[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width)*i, 0,self.view.frame.size.width,self.view.frame.size.height)];
            NSString *path = [NSString string];
            path = [imageBundle pathForResource:[NSString stringWithFormat:@"BBUserGuider%1d@2x",i] ofType:@"png" inDirectory:@"GuiderImage"];
            imageView.image = [UIImage imageWithContentsOfFile:path];
            [_userGuiderScrollView  addSubview:imageView];
            if (i==kBBUserGuiderImgCount-1) {
                imageView.userInteractionEnabled = YES;
                self.userGuiderImgView=imageView;
                [imageView addSubview:self.startBtn];
            }
            
            _userGuiderScrollView.contentSize=CGSizeMake((kBBUserGuiderImgCount+1)*(self.view.frame.size.width), self.view.frame.size.height);
            _userGuiderScrollView.pagingEnabled=YES;
            _userGuiderScrollView.showsVerticalScrollIndicator=NO;
            _userGuiderScrollView.showsHorizontalScrollIndicator=NO;
            _userGuiderScrollView.bounces=NO;
            _userGuiderScrollView.delegate = self;
        }
    }
    
    return _userGuiderScrollView;
}

-(UIButton *)startBtn{
    if (!_startBtn) {
        _startBtn=[[UIButton  alloc] init];
        _startBtn.backgroundColor = [UIColor clearColor];
        _startBtn.frame = self.view.frame;
        [_startBtn  addTarget:self action:@selector(startClick) forControlEvents: UIControlEventTouchUpInside];
    }
    return  _startBtn;
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x > (kBBUserGuiderImgCount - 1)*(self.view.frame.size.width)) {
        [self startClick];
    }
}

//此处为 替换 rootViewController
- (void)startClick{
    [[AppDelegate shareAppDelegate] setupRootViewController:[[BBTabBarController alloc] init]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
