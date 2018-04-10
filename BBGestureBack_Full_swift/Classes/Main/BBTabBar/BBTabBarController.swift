//
//  BBTabBarController.swift
//  BBGestureBack_Full_swift
//
//  Created by Bonway(黄邦伟) on 2018/4/9.
//  Copyright © 2018年 Bonway. All rights reserved.
//

import UIKit

class BBTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpAllChildViewController()
        
    }

    func setUpAllChildViewController() {
        setUpOneChildViewController(vc: HomeViewController(), image: UIImage(named:  "TabBarHomeNormal")!, selectedImage: UIImage(named: "TabBarHomeSelected")!, title: "Home")
        setUpOneChildViewController(vc: UserViewController(), image: UIImage(named:  "TabBarUserNormal")!, selectedImage: UIImage(named: "TabBarUserSelected")!, title: "User")
    }
    
    func setUpOneChildViewController(vc:UIViewController,image:UIImage,selectedImage:UIImage,title:String) {

        vc.title = title
        vc.tabBarItem.image = image
        vc.tabBarItem.selectedImage = image
        let navVC = UINavigationController(rootViewController: vc)
        addChildViewController(navVC)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
