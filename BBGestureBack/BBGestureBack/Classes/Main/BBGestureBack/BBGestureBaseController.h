//
//  BBGestureBaseController.h
//  BBGestureBack
//
//  Created by user on 2018/3/17.
//  Copyright © 2018年 Bonway. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBGestureBaseController : UIViewController
@property (nonatomic) Boolean gestureEnabled;// default is YES. 
@end


@interface BBScreenShotView : UIView
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) NSMutableArray *arrayImage;

- (void)showEffectChange:(CGPoint)pt;
- (void)restore;
- (void)screenShot;
@end
