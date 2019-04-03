//  希望您的举手之劳，能为我点颗赞，谢谢~
//  代码地址: https://github.com/Bonway/BBGestureBack
//  BBGestureBack
//  Created by Bonway on 2016/3/17.
//  Copyright © 2016年 Bonway. All rights reserved.
//

import UIKit

class BBUserGuiderController: BBGestureBaseController {

    lazy var userGuiderScrollView: UIScrollView = {
        
        let userGuiderScrollView = UIScrollView(frame: view.bounds)
        let fileStr = Bundle.main.path(forResource: "BBUserGuider", ofType: "bundle")
        let imageBundle = Bundle(path: fileStr!)
        
        for i in 0..<kBBUserGuiderImgCount {
            let imageView: UIImageView = UIImageView.init(frame: CGRect(x: (view.frame.size.width) * CGFloat(i) ,y: 0, width: view.frame.size.width, height: view.frame.size.height))
            let path = imageBundle?.path(forResource: "BBUserGuider\(i)@2x", ofType: "png", inDirectory: "GuiderImage")
            imageView.image = UIImage.init(contentsOfFile: path!)
            userGuiderScrollView.addSubview(imageView)
            if i == kBBUserGuiderImgCount - 1 {
                imageView.isUserInteractionEnabled = true
                userGuiderImgView = imageView
                imageView.addSubview(startBtn)
            }
            
            userGuiderScrollView.contentSize = CGSize(width: CGFloat(kBBUserGuiderImgCount+1)*(view.frame.size.width), height: view.frame.size.height)
            userGuiderScrollView.isPagingEnabled = true
            userGuiderScrollView.showsVerticalScrollIndicator = false
            userGuiderScrollView.showsHorizontalScrollIndicator = false
            userGuiderScrollView.bounces = false
            userGuiderScrollView.delegate = self
        }
        return userGuiderScrollView
    }()
    
    lazy var startBtn: UIButton = {
        let startBtn = UIButton()
        startBtn.backgroundColor = UIColor.clear
        startBtn.frame = view.frame
        startBtn.addTarget(self, action: #selector(startClick), for: .touchUpInside)
        return startBtn
    }()
    var userGuiderImgView: UIImageView?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(userGuiderScrollView)
        
    }
    
    @objc func startClick() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.setupRootViewController(rootViewController: BBTabBarController())
    }
}

extension BBUserGuiderController : UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x > CGFloat(kBBUserGuiderImgCount - 1)*(view.frame.size.width) {
            startClick()
        }
    }
}
