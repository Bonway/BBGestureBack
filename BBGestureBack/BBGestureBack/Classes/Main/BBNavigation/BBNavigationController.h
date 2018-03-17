//
//  BBNavigationController.h
//  BBGestureBack
//
//  Created by user on 2018/3/17.
//  Copyright © 2018年 Bonway. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBNavigationController : UINavigationController
@property (strong ,nonatomic) NSMutableArray *arrayScreenshot;

@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;
@end
