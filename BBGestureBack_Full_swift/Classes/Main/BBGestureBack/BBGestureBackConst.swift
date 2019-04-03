//  希望您的举手之劳，能为我点颗赞，谢谢~
//  代码地址: https://github.com/Bonway/BBGestureBack
//  BBGestureBack
//  Created by Bonway on 2016/3/17.
//  Copyright © 2016年 Bonway. All rights reserved.
//

import UIKit


func BBColor(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
let bbScreenWidth = UIScreen.main.bounds.width
/// 屏幕的高度
let bbScreenHeight = UIScreen.main.bounds.height
let bb_IsIphone = (bbScreenHeight - 812 == 0 || bbScreenHeight - 896 == 0) ? true : false

//The ifrst user guider image (第一次引导图)
let kBBFirstLaunch:String = "BBFirstLaunch"
// Open iPhone X Style.（是否打开Phone X风格）
let kBBIsOpenIphoneXStyle:Bool = true
// The default is 40， iPhone X Style Corner。（默认为40，iPhone X 圆角弧度）
let kBBIphoneXStyleCorner:CGFloat! = 40
// The default is 3， User guider image count。（默认为3，用户引导图总页数）
let kBBUserGuiderImgCount:Int = 3
// Screen system to return gesture.（是否屏蔽系统返回手势）
let kBBIsCanleSystemPan:Bool = true
// The distance from the left can be automatically returned.(距离左边多少距离，可以自动返回)
let kBBDistanceToLeft:CGFloat! = 70.0
// BottomView Scaling.(底层缩放比例)
let kBBWindowToScale:CGFloat! = 0.95
// BottomView alpha.(底层透明度)
let kBBMaskingAlpha:CGFloat! = 0.9
// Automatic return speed.(自动返回速度)
let kBBGestureSpeed:TimeInterval! = 0.3
// Range of drag and drop.(拖拽的范围,大于此值才有效果)
let kBBDistanceToPan:CGFloat! = 10
// The default is 0, 0 for full screen return, and also for distance.（默认为0，0为全屏返回，也可指定距离）
let kBBDistanceToStart:CGFloat! = 100
