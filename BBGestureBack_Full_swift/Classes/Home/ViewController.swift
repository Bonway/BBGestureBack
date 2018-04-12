//  代码地址: https://github.com/Bonway/BBGestureBack
//  BBGestureBack
//  Created by Bonway on 2016/3/17.
//  Copyright © 2016年 Bonway. All rights reserved.
//

import UIKit

class ViewController: BBGestureBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let popBtn = UIButton()
        popBtn.frame = CGRect(x: 100, y: 100, width: 150, height: 50)
        popBtn.backgroundColor = UIColor.red
        popBtn.setTitle("BBPop", for: UIControlState.normal)
        popBtn.addTarget(self, action: #selector(popClick), for: UIControlEvents.touchUpInside)
        self.view.addSubview(popBtn)
        
        let popToVCBtn = UIButton()
        popToVCBtn.frame = CGRect(x: 100, y: 200, width: 150, height: 50)
        
        popToVCBtn.backgroundColor = UIColor.red
        popToVCBtn.setTitle("BBPopToVC", for: UIControlState.normal)
        popToVCBtn.addTarget(self, action: #selector(popToClick), for: UIControlEvents.touchUpInside)
        self.view.addSubview(popToVCBtn)
        
        let popToRootBtn = UIButton()
        popToRootBtn.frame = CGRect(x: 100, y: 300, width: 150, height: 50)
        popToRootBtn.backgroundColor = UIColor.red
        popToRootBtn.setTitle("BBPopToRootVC", for: UIControlState.normal)
        popToRootBtn.addTarget(self, action: #selector(popToRootClick), for: UIControlEvents.touchUpInside)
        self.view.addSubview(popToRootBtn)
        
        let sysPopBtn = UIButton()
        sysPopBtn.frame = CGRect(x: 100, y: 400, width: 150, height: 50)
        sysPopBtn.backgroundColor = UIColor.blue
        sysPopBtn.setTitle("sysPop", for: UIControlState.normal)
        sysPopBtn.addTarget(self, action: #selector(sysPopClick), for: UIControlEvents.touchUpInside)
        self.view.addSubview(sysPopBtn)
    }

    @objc func popClick() {
        self.bb_popViewController();
    }
    
    @objc func popToClick() {
        self.bb_popToViewController(viewController: (self.navigationController?.viewControllers[0])!)
    }
    
    @objc func popToRootClick() {
        self.bb_popToRootViewController()
    }
    
    @objc func sysPopClick() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

