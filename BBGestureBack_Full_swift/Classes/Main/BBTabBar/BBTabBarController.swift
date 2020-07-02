//  希望您的举手之劳，能为我点颗赞，谢谢~
//  代码地址: https://github.com/Bonway/BBGestureBack
//  BBGestureBack
//  Created by Bonway on 2016/3/17.
//  Copyright © 2016年 Bonway. All rights reserved.
//
import UIKit

class BBTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAllChildViewController()
        
        //iOS 闪动问题，明白了一看就懂
        UITabBar.appearance().isTranslucent = false
        UINavigationBar.appearance().isTranslucent = false
        self.tabBar.tintColor = UIColor.blue
        self.tabBar.barTintColor = UIColor .white
    }

    func setUpAllChildViewController() {
        setUpOneChildViewController(vc: HomeViewController(), image: UIImage(named:  "TabBarHomeNormal")!, selectedImage: UIImage(named: "TabBarHomeSelected")!, title: "Home")
        setUpOneChildViewController(vc: UserViewController(), image: UIImage(named:  "TabBarUserNormal")!, selectedImage: UIImage(named: "TabBarUserSelected")!, title: "User")
    }
    
    func setUpOneChildViewController(vc:UIViewController,image:UIImage,selectedImage:UIImage,title:String) {

        vc.title = title
        vc.tabBarItem.image = image
        vc.tabBarItem.selectedImage = image
        let navVC = BBNavigationController(rootViewController: vc)
        addChildViewController(navVC)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
