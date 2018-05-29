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

        
        view.backgroundColor = UIColor.blue
        let sysBtn = UIButton()
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
