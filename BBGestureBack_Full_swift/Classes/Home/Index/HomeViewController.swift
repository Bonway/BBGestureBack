//  希望您的举手之劳，能为我点颗赞，谢谢~
//  代码地址: https://github.com/Bonway/BBGestureBack
//  BBGestureBack
//  Created by Bonway on 2016/3/17.
//  Copyright © 2016年 Bonway. All rights reserved.
//

import UIKit

class HomeViewController: BBGestureBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //iOS12.1 UINavigationController + UITabBarController（ UITabBar 磨砂），在 系统的 popViewControllerAnimated 会遇到tabbar布局错乱的问题，所以需添加以下方法。
        //当然你也可以自己选择添加到底层的navigationController中，进行处理。
        UITabBar.appearance().isTranslucent = false
        //---------------------------------------
        
        let btn = UIButton()
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        btn.backgroundColor = UIColor.blue
        btn.setTitle("sysPush", for: UIControlState.normal)
        btn.addTarget(self, action: #selector(pushClick), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(btn)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @objc func pushClick() {
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }


}
