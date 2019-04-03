//  希望您的举手之劳，能为我点颗赞，谢谢~
//  代码地址: https://github.com/Bonway/BBGestureBack
//  BBGestureBack
//  Created by Bonway on 2016/3/17.
//  Copyright © 2016年 Bonway. All rights reserved.
//


#import "BBGestureBaseController.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import "BBGestureBackConst.h"




static char bbListenTabbarViewMove[] = "bbListenTabbarViewMove";

@interface BBGestureBaseController ()

@property (nonatomic,strong)UIBarButtonItem *bbBackBarItem;

@end

@implementation BBGestureBaseController

- (id)init{
    self = [super init];
    if (self) {
        self.isEnablePanGesture = YES;
        self.blankType = BBPopTypeViewController;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.navigationController.viewControllers.count > 1) {
        self.navigationItem.leftBarButtonItem = self.bbBackBarItem;
    }
}

-(UIBarButtonItem *)bbBackBarItem{
    if (!_bbBackBarItem) {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setImage:[UIImage imageNamed:@"bb_navigation_back"] forState:UIControlStateNormal];
        backBtn.imageView.contentMode = UIViewContentModeCenter;
        [backBtn addTarget:self action:@selector(dismissSelf) forControlEvents:UIControlEventTouchUpInside];
        _bbBackBarItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
        backBtn.frame = CGRectMake(0, 0, 44, 44);
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -25, 0,0);
    }
    return _bbBackBarItem;
}

- (void)dismissSelf{
    
    switch (self.blankType) {
        case BBPopTypeViewController:
            [self bb_popViewController];
            break;
        case BBPopTypeToRootViewController:
            [self bb_popToRootViewController];
            break;
        default:
            break;
    }
    
    
}



-(void)bb_basePopViewController:(UIViewController *)viewController PopType:(BBPopType)popType{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIViewController *rootVC = appDelegate.window.rootViewController;
    UIViewController *presentedVC = rootVC.presentedViewController;
    appDelegate.gestureBaseView.hidden = NO;
    
    appDelegate.gestureBaseView.maskView.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:kBBMaskingAlpha];
    appDelegate.gestureBaseView.imgView.transform = CGAffineTransformMakeScale(kBBWindowToScale, kBBWindowToScale);
    
    [UIView animateWithDuration:kBBGestureSpeed animations:^{
        rootVC.view.transform = CGAffineTransformMakeTranslation(([UIScreen mainScreen].bounds.size.width), 0);
        presentedVC.view.transform = CGAffineTransformMakeTranslation(([UIScreen mainScreen].bounds.size.width), 0);
        if (BBIS_IPHONEX && kBBIsOpenIphoneXStyle) {
            rootVC.view.layer.masksToBounds = YES;
            rootVC.view.layer.cornerRadius = kBBIphoneXStyleCorner;
            presentedVC.view.layer.masksToBounds = YES;
            presentedVC.view.layer.cornerRadius = kBBIphoneXStyleCorner;
        }
    } completion:^(BOOL finished) {
        switch (popType) {
            case BBPopTypeViewController:
                [self.navigationController popViewControllerAnimated:NO];
                break;
            case BBPopTypeToViewController:
                [self.navigationController popToViewController:viewController animated:NO];
                break;
            case BBPopTypeToRootViewController:
                [self.navigationController popToRootViewControllerAnimated:NO];
                break;
            default:
                break;
        }
        rootVC.view.transform = CGAffineTransformIdentity;
        presentedVC.view.transform = CGAffineTransformIdentity;
        if (BBIS_IPHONEX && kBBIsOpenIphoneXStyle) {
            rootVC.view.layer.masksToBounds = NO;
            rootVC.view.layer.cornerRadius = 0;
            presentedVC.view.layer.masksToBounds = NO;
            presentedVC.view.layer.cornerRadius = 0;
        }
        appDelegate.gestureBaseView.hidden = YES;
        
    }];
}

- (void)bb_popViewController{
    [self bb_basePopViewController:nil PopType:BBPopTypeViewController];
}

-(void)bb_popToRootViewController{
    [self bb_basePopViewController:nil PopType:BBPopTypeToRootViewController];
}

-(void)bb_popToViewController:(UIViewController *)viewController{
    [self bb_basePopViewController:viewController PopType:BBPopTypeToViewController];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
@interface BBGestureBaseView()
@property(nonatomic,weak)UIView *rootControllerView;
@end

@implementation BBGestureBaseView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.arrayImage = [NSMutableArray array];
        self.backgroundColor = [UIColor blackColor];
        self.imgView = [[UIImageView alloc] initWithFrame:self.bounds];
        if (BBIS_IPHONEX && kBBIsOpenIphoneXStyle) {
            self.imgView.layer.masksToBounds = YES;
            self.imgView.layer.cornerRadius = kBBIphoneXStyleCorner;
        }
        self.maskView = [[UIView alloc] initWithFrame:self.bounds];
        self.maskView.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:kBBMaskingAlpha];
        [self addSubview: self.imgView];
        [self addSubview: self.maskView];
        [self addObserver];
    }
    return self;
}

- (void)removeObserver {
    [self.rootControllerView removeObserver:self forKeyPath:@"transform" context:bbListenTabbarViewMove];
}

- (void)addObserver {
    self.rootControllerView = [AppDelegate shareAppDelegate].window.rootViewController.view;
    [self.rootControllerView addObserver:self forKeyPath:@"transform" options:NSKeyValueObservingOptionNew context:bbListenTabbarViewMove];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if (context == bbListenTabbarViewMove){
        NSValue *value  = [change objectForKey:NSKeyValueChangeNewKey];
        CGAffineTransform newTransform = [value CGAffineTransformValue];
        [self showEffectChange:CGPointMake(newTransform.tx, 0) ];
    }
}

- (void)showEffectChange:(CGPoint)pt{
    
    if (pt.x > 0){
        _maskView.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:-pt.x / ([UIScreen mainScreen].bounds.size.width) * kBBMaskingAlpha + kBBMaskingAlpha];
        _imgView.transform = CGAffineTransformMakeScale(kBBWindowToScale + (pt.x / ([UIScreen mainScreen].bounds.size.width) * (1 - kBBWindowToScale)), kBBWindowToScale + (pt.x / ([UIScreen mainScreen].bounds.size.width) * (1 - kBBWindowToScale)));
    }
    if (pt.x < 0){
        _maskView.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0.5];
        _imgView.transform = CGAffineTransformIdentity;
    }
}

- (void)restore {
    if (_maskView && _imgView){
        _maskView.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:kBBMaskingAlpha];
        _imgView.transform = CGAffineTransformMakeScale(kBBWindowToScale, kBBWindowToScale);
    }
}

- (void)screenShot{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height), YES, 0);
    [appDelegate.window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRef imageRef = viewImage.CGImage;
    UIImage *sendImage = [[UIImage alloc] initWithCGImage:imageRef];
    self.imgView.image = sendImage;
    self.imgView.transform = CGAffineTransformMakeScale(kBBWindowToScale, kBBWindowToScale);
}

- (void)dealloc{
    [self removeObserver];
}

- (void)layoutSubviews{
    [super layoutSubviews];
}
@end
