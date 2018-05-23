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

typedef enum _BBPopType {
    BBPopTypeViewController  = 0,
    BBPopTypeToViewController,
    BBPopTypeToRootViewController
} BBPopType;


static char bbListenTabbarViewMove[] = "bbListenTabbarViewMove";

@interface BBGestureBaseController ()

@end

@implementation BBGestureBaseController

- (id)init{
    self = [super init];
    if (self) {
        self.isEnablePanGesture = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}




-(void)bb_basePopViewController:(UIViewController *)viewController PopType:(BBPopType)popType{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIViewController *rootVC = appDelegate.window.rootViewController;
    UIViewController *presentedVC = rootVC.presentedViewController;
    appDelegate.gestureBaseView.hidden = NO;
    
    appDelegate.gestureBaseView.maskView.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:BBMaskingAlpha];
    appDelegate.gestureBaseView.imgView.transform = CGAffineTransformMakeScale(BBWindowToScale, BBWindowToScale);
    
    [UIView animateWithDuration:BBGestureSpeed animations:^{
        rootVC.view.transform = CGAffineTransformMakeTranslation(([UIScreen mainScreen].bounds.size.width), 0);
        presentedVC.view.transform = CGAffineTransformMakeTranslation(([UIScreen mainScreen].bounds.size.width), 0);
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

@implementation BBGestureBaseView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.arrayImage = [NSMutableArray array];
        self.backgroundColor = [UIColor blackColor];
        self.imgView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.maskView = [[UIView alloc] initWithFrame:self.bounds];
        self.maskView.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:BBMaskingAlpha];
        [self addSubview: self.imgView];
        [self addSubview: self.maskView];
        [[AppDelegate shareAppDelegate].window.rootViewController.view addObserver:self forKeyPath:@"transform" options:NSKeyValueObservingOptionNew context:bbListenTabbarViewMove];
    }
    return self;
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
        _maskView.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:-pt.x / ([UIScreen mainScreen].bounds.size.width) * BBMaskingAlpha + BBMaskingAlpha];
        _imgView.transform = CGAffineTransformMakeScale(BBWindowToScale + (pt.x / ([UIScreen mainScreen].bounds.size.width) * (1 - BBWindowToScale)), BBWindowToScale + (pt.x / ([UIScreen mainScreen].bounds.size.width) * (1 - BBWindowToScale)));
    }
    if (pt.x < 0){
        _maskView.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0.5];
        _imgView.transform = CGAffineTransformIdentity;
    }
}

- (void)restore {
    if (_maskView && _imgView){
        _maskView.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:BBMaskingAlpha];
        _imgView.transform = CGAffineTransformMakeScale(BBWindowToScale, BBWindowToScale);
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
    self.imgView.transform = CGAffineTransformMakeScale(BBWindowToScale, BBWindowToScale);
}

- (void)dealloc{
    [[AppDelegate shareAppDelegate].window.rootViewController.view removeObserver:self forKeyPath:@"transform" context:bbListenTabbarViewMove];
}

- (void)layoutSubviews{
    [super layoutSubviews];
}
@end
