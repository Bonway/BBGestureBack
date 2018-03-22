//
//  BBNavigationController.m
//  BBGestureBack
//
//  Created by user on 2018/3/17.
//  Copyright © 2018年 Bonway. All rights reserved.
//

#import "BBNavigationController.h"
#import "BBGestureBaseController.h"
#import "BBGestureBackConst.h"
#import "AppDelegate.h"
@interface BBNavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation BBNavigationController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.arrayScreenshot = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    //屏蔽系统的手势
    self.interactivePopGestureRecognizer.enabled = NO;
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    _panGesture.delegate = self;
    [self.view addGestureRecognizer:_panGesture];
}
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.view == self.view) {
        BBGestureBaseController *topView = (BBGestureBaseController *)self.topViewController;
        
        if (!topView.gestureEnabled)
            return NO;
        else
        {
            CGPoint translate = [gestureRecognizer translationInView:self.view];
            
            BOOL possible = translate.x != 0 && fabs(translate.y) == 0;
            if (possible)
                return YES;
            else
                return NO;
            return YES;
        }
    }
    return NO;
}
///此方法可以解决滑动的冲突，
///举个栗子：侧滑返回和UIScrollView的本身滑动冲突了。再举个栗子：tableviewCell身上自带的系统删除，筛选界面展开的左滑事件有冲突
///下面详细解释此方法:
///同一个view上如果作用了两个相同类型的手势，那么系统默认只会响应一个，why？因为系统是SB，系统还没有这么智能的知道你想怎么样，他不会知道手势冲突的时候让那个接受手势，剩下的就是程序员的工作了，我们可以在此方法中判断，机制的做出明确的处理，该方法返回YES时，意味着所有相同类型的手势辨认都会得到处理。
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if ([otherGestureRecognizer isKindOfClass:NSClassFromString(@"UIScrollViewPanGestureRecognizer")] || [otherGestureRecognizer isKindOfClass:NSClassFromString(@"UIPanGestureRecognizer")]|| [otherGestureRecognizer isKindOfClass:NSClassFromString(@"UIScrollViewPagingSwipeGestureRecognizer")]) //
    {
        //冲突要有两个，二者不可兼得
        UIView *aView = otherGestureRecognizer.view;
        if ([aView isKindOfClass:[UIScrollView class]]) {
            UIScrollView *sv = (UIScrollView *)aView;
            if (sv.contentOffset.x==0) {//判断依据
                return YES;
            }
        }
        return NO;
    }
    return YES;
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGesture
{
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    UIViewController *rootVC = appdelegate.window.rootViewController;
    UIViewController *presentedVC = rootVC.presentedViewController;
    if (self.viewControllers.count == 1)
    {
        return;
    }
    if (panGesture.state == UIGestureRecognizerStateBegan)
    {
        appdelegate.screenshotView.hidden = NO;
    }
    else if (panGesture.state == UIGestureRecognizerStateChanged)
    {
        CGPoint point_inView = [panGesture translationInView:self.view];
        
        if (point_inView.x >= 10)
        {
            rootVC.view.transform = CGAffineTransformMakeTranslation(point_inView.x - 10, 0);
            presentedVC.view.transform = CGAffineTransformMakeTranslation(point_inView.x - 10, 0);
        }
    }
    else if (panGesture.state == UIGestureRecognizerStateEnded)
    {
        CGPoint point_inView = [panGesture translationInView:self.view];
        if (point_inView.x >= BBDistanceToLeft)
        {
            [UIView animateWithDuration:0.3 animations:^{
                rootVC.view.transform = CGAffineTransformMakeTranslation(([UIScreen mainScreen].bounds.size.width), 0);
                presentedVC.view.transform = CGAffineTransformMakeTranslation(([UIScreen mainScreen].bounds.size.width), 0);
            } completion:^(BOOL finished) {
                [self popViewControllerAnimated:NO];
                rootVC.view.transform = CGAffineTransformIdentity;
                presentedVC.view.transform = CGAffineTransformIdentity;
                appdelegate.screenshotView.hidden = YES;
            }];
        }
        else
        {
            [UIView animateWithDuration:0.3 animations:^{
                rootVC.view.transform = CGAffineTransformIdentity;
                presentedVC.view.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                appdelegate.screenshotView.hidden = YES;
            }];
        }
    }
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    BBGestureBaseController *topView = (BBGestureBaseController *)self.topViewController;
    
    if (topView.gestureEnabled == NO)     return NO;
    if (self.viewControllers.count <= 1)    return NO;
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        CGPoint point = [touch locationInView:gestureRecognizer.view];
        if (point.x < [UIScreen mainScreen].bounds.size.width) {
            return YES;
        }
    }
    return NO;
}
- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSArray *arr = [super popToViewController:viewController animated:animated];
    
    if (self.arrayScreenshot.count > arr.count)
    {
        for (int i = 0; i < arr.count; i++) {
            [self.arrayScreenshot removeLastObject];
        }
    }
    return arr;
}




- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count == 0){
        return [super pushViewController:viewController animated:animated];
    }else if (self.viewControllers.count>=1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(appdelegate.window.frame.size.width, appdelegate.window.frame.size.height), YES, 0);
    [appdelegate.window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.arrayScreenshot addObject:viewImage];
    appdelegate.screenshotView.imgView.image = viewImage;
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [self.arrayScreenshot removeLastObject];
    UIImage *image = [self.arrayScreenshot lastObject];
    if (image)
        appdelegate.screenshotView.imgView.image = image;
    
    UIViewController *v = [super popViewControllerAnimated:animated];
    return v;
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (self.arrayScreenshot.count > 2)
    {
        [self.arrayScreenshot removeObjectsInRange:NSMakeRange(1, self.arrayScreenshot.count - 1)];
    }
    UIImage *image = [self.arrayScreenshot lastObject];
    if (image)
        appdelegate.screenshotView.imgView.image = image;
    
    return [super popToRootViewControllerAnimated:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
