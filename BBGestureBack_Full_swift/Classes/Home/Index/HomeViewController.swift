//  代码地址: https://github.com/Bonway/BBGestureBack
//  BBGestureBack
//  Created by Bonway on 2016/3/17.
//  Copyright © 2016年 Bonway. All rights reserved.
//

import UIKit

class HomeViewController: BBGestureBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let btn = UIButton()
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        btn.backgroundColor = UIColor.red
        btn.setTitle("push", for: UIControlState.normal)
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
