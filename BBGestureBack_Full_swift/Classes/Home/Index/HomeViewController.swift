//
//  HomeViewController.swift
//  BBGestureBack_Full_swift
//
//  Created by Bonway(黄邦伟) on 2018/4/9.
//  Copyright © 2018年 Bonway. All rights reserved.
//

import UIKit

class HomeViewController: BBGestureBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let btn = UIButton()
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        btn.backgroundColor = UIColor.red
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
