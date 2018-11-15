//
//  HomeViewController.swift
//  BBGestureBack_SysFull_swift
//
//  Created by Bonway on 2018/5/29.
//  Copyright © 2018年 Bonway. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //iOS12.1 UINavigationController + UITabBarController（ UITabBar 磨砂），在 系统的 popViewControllerAnimated 会遇到tabbar布局错乱的问题，所以需添加以下方法。
        //当然你也可以自己选择添加到底层的navigationController中，进行处理。
        UITabBar.appearance().isTranslucent = false
        //---------------------------------------
        
        view.backgroundColor = UIColor.white
        let sysBtn = UIButton()
        sysBtn.backgroundColor = UIColor.blue
        sysBtn.frame = CGRect(x: 100, y: 100, width: 110, height: 100)
        sysBtn.setTitle("sysPush", for: UIControlState.normal)
        sysBtn.addTarget(self, action: #selector(sysPushClick), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(sysBtn)
    }

    
    @objc func sysPushClick() {
        self.navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
