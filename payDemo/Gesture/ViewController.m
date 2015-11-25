//
//  ViewController.m
//  Gesture
//
//  Created by Bonway on 15/11/6.
//  Copyright © 2015年 yinbanke. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
{
    NSMutableArray *buttonArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
//{
//    // Drawing code
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
//    CGFloat colors[] =
//    {
//        134 / 255.0, 157 / 255.0, 147 / 255.0, 1.00,
//        3 / 255.0,  3 / 255.0, 37 / 255.0, 1.00,
//    };
//    CGGradientRef gradient = CGGradientCreateWithColorComponents
//    (rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
//    CGColorSpaceRelease(rgb);
//    CGContextDrawLinearGradient(context, gradient,CGPointMake
//                                (0.0,0.0) ,CGPointMake(0.0,self.view.frame.size.height),
//                                kCGGradientDrawsBeforeStartLocation);
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com