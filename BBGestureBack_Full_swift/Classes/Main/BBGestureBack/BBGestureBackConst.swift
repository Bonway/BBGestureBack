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

var BBDistanceToLeft:CGFloat! = 70.0
var BBWindowToScale:CGFloat! = 0.95
var BBMaskingAlpha:CGFloat! = 0.9
var BBGestureSpeed:TimeInterval! = 0.3
var BBDistanceToPan:CGFloat! = 10

