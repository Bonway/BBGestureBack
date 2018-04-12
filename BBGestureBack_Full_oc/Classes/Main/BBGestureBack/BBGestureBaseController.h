//  代码地址: https://github.com/Bonway/BBGestureBack
//  BBGestureBack
//  Created by Bonway on 2016/3/17.
//  Copyright © 2016年 Bonway. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface BBGestureBaseController : UIViewController
@property (nonatomic) Boolean isEnablePanGesture;// default is YES.

- (void)bb_popViewController;
- (void)bb_popToViewController:(UIViewController *)viewController;
- (void)bb_popToRootViewController;

@end


@interface BBGestureBaseView : UIView
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) NSMutableArray *arrayImage;

- (void)showEffectChange:(CGPoint)pt;
- (void)restore;
- (void)screenShot;
@end
