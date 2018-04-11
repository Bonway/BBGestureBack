//  代码地址: https://github.com/Bonway/BBGestureBack
//  BBGestureBack
//  Created by Bonway on 2016/3/17.
//  Copyright © 2016年 Bonway. All rights reserved.
//


#import "BBGestureBaseController.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import "BBGestureBackConst.h"
static char szListenTabbarViewMove[] = "listenTabViewMove";

@interface BBGestureBaseController ()

@end

@implementation BBGestureBaseController

- (id)init{
    self = [super init];
    if (self) {
        self.gestureEnabled = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}



- (void)bb_popViewController:(UINavigationController *)navigationController{
    
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIViewController *rootVC = appdelegate.window.rootViewController;
    UIViewController *presentedVC = rootVC.presentedViewController;
    appdelegate.gestureBaseView.hidden = NO;
    
    appdelegate.gestureBaseView.maskView.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:BBMaskingAlpha];
    appdelegate.gestureBaseView.imgView.transform = CGAffineTransformMakeScale(BBWindowToScale, BBWindowToScale);
    
    [UIView animateWithDuration:BBGestureSpeed animations:^{
        rootVC.view.transform = CGAffineTransformMakeTranslation(([UIScreen mainScreen].bounds.size.width), 0);
        presentedVC.view.transform = CGAffineTransformMakeTranslation(([UIScreen mainScreen].bounds.size.width), 0);
    } completion:^(BOOL finished) {
        [navigationController popViewControllerAnimated:NO];
        rootVC.view.transform = CGAffineTransformIdentity;
        presentedVC.view.transform = CGAffineTransformIdentity;
        appdelegate.gestureBaseView.hidden = YES;
    }];
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
        [[AppDelegate shareAppDelegate].window.rootViewController.view addObserver:self forKeyPath:@"transform" options:NSKeyValueObservingOptionNew context:szListenTabbarViewMove];
    }
    return self;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if (context == szListenTabbarViewMove){
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
    AppDelegate *appdelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height), YES, 0);
    [appdelegate.window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRef imageRef = viewImage.CGImage;
    UIImage *sendImage = [[UIImage alloc] initWithCGImage:imageRef];
    self.imgView.image = sendImage;
    self.imgView.transform = CGAffineTransformMakeScale(BBWindowToScale, BBWindowToScale);
}

- (void)dealloc{
    [[AppDelegate shareAppDelegate].window.rootViewController.view removeObserver:self forKeyPath:@"transform" context:szListenTabbarViewMove];
}

- (void)layoutSubviews{
    [super layoutSubviews];
}
@end
