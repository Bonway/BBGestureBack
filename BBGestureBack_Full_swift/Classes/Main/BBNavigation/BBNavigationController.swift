//  希望您的举手之劳，能为我点颗赞，谢谢~
//  代码地址: https://github.com/Bonway/BBGestureBack
//  BBGestureBack
//  Created by Bonway on 2016/3/17.
//  Copyright © 2016年 Bonway. All rights reserved.
//

import UIKit

class BBNavigationController: UINavigationController,UIGestureRecognizerDelegate,UINavigationControllerDelegate{

    var arrayScreenshot : NSMutableArray!
    var panGesture : UIPanGestureRecognizer?
    var webURL : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.interactivePopGestureRecognizer?.isEnabled = !kBBIsCanleSystemPan
        
        arrayScreenshot = NSMutableArray.init()
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        view.addGestureRecognizer(panGesture!)
        panGesture?.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if (gestureRecognizer.view == self.view && gestureRecognizer.location(in: view).x < (kBBDistanceToStart == 0 ? UIScreen.main.bounds.width : kBBDistanceToStart)) {
            let topView = topViewController as! BBGestureBaseController
            if (!topView.isEnablePanGesture) {
                return false;
            } else {
                let gesture = gestureRecognizer as! UIPanGestureRecognizer
                let translate = gesture.translation(in :view)
                let possible = translate.x != 0 && fabs(translate.y) == 0;
                
                if (possible){
                    return true
                }else {
                    return false
                }
            }
        }
        return false
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if otherGestureRecognizer.isKind(of: NSClassFromString("UIScrollViewPanGestureRecognizer")!) || otherGestureRecognizer.isKind(of: NSClassFromString("UIPanGestureRecognizer")!) || otherGestureRecognizer.isKind(of: NSClassFromString("UIScrollViewPagingSwipeGestureRecognizer")!) {
            
            let aView = otherGestureRecognizer.view
            if aView!.isKind(of: UIScrollView.self) {
                let sv = aView as! UIScrollView
                if sv.contentOffset.x == 0 {
                    
                    if otherGestureRecognizer.isKind(of: NSClassFromString("UIScrollViewPanGestureRecognizer")!) && otherGestureRecognizer.state != .began {
                        return false
                    }
                    
                    return true
                    
                }
            }
            
            return false
        }
        return true
    }
    
    @objc func handlePanGesture(_ panGesture : UIPanGestureRecognizer) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let rootVC = appDelegate.window?.rootViewController
        let presentedVC = rootVC?.presentedViewController
        
        
        
        if (self.viewControllers.count == 1) {
            return
        }
        if (panGesture.state == UIGestureRecognizerState.began) {
            
            if (bb_IsIphone && kBBIsOpenIphoneXStyle) {
                rootVC?.view.layer.masksToBounds = true;
                rootVC?.view.layer.cornerRadius = kBBIphoneXStyleCorner;
                presentedVC?.view.layer.masksToBounds = true;
                presentedVC?.view.layer.cornerRadius = kBBIphoneXStyleCorner;
            }
            
            appDelegate.gestureBaseView?.isHidden = false;
        }
        else if (panGesture.state == UIGestureRecognizerState.changed) {
            let point_inView = panGesture.translation(in: view)
            if (point_inView.x >= 10) {
                rootVC?.view.transform = CGAffineTransform(translationX: point_inView.x - 10, y: 0)
                presentedVC?.view.transform = CGAffineTransform(translationX: point_inView.x - 10, y: 0)
            }
        }
        else if (panGesture.state == UIGestureRecognizerState.ended) {
            
            let point_inView = panGesture.translation(in: view)
            if (point_inView.x >= kBBDistanceToLeft) {
                UIView.animate(withDuration: 0.3, animations: {
                    rootVC?.view.transform = CGAffineTransform(translationX: UIScreen.main.bounds.size.width, y: 0)
                    presentedVC?.view.transform = CGAffineTransform(translationX: UIScreen.main.bounds.size.width, y: 0)
                }, completion: { (true) in
                    self.popViewController(animated: false)
                    rootVC?.view.transform = CGAffineTransform.identity
                    presentedVC?.view.transform = CGAffineTransform.identity
                    appDelegate.gestureBaseView?.isHidden = true
                })
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    rootVC?.view.transform = CGAffineTransform.identity
                    presentedVC?.view.transform = CGAffineTransform.identity
                }, completion: { (true) in
                    
                    if (bb_IsIphone && kBBIsOpenIphoneXStyle) {
                        rootVC?.view.layer.masksToBounds = false;
                        rootVC?.view.layer.cornerRadius = 0;
                        presentedVC?.view.layer.masksToBounds = false;
                        presentedVC?.view.layer.cornerRadius = 0;
                    }
                    appDelegate.gestureBaseView?.isHidden = true
                })
            }
        }
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if (viewControllers.count == 0) {
            return super.pushViewController(viewController, animated: animated)
        }else if (viewControllers.count>=1) {
            viewController.hidesBottomBarWhenPushed = true//隐藏二级页面的tabbar
        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        UIGraphicsBeginImageContextWithOptions(CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), true, 0);
        appDelegate.window?.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        arrayScreenshot.add(image!)
        appDelegate.gestureBaseView?.imgView?.image = image
        super.pushViewController(viewController, animated: animated)
    }
    
    @discardableResult
    override func popViewController(animated: Bool) -> UIViewController? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        arrayScreenshot.removeLastObject()
        let image = arrayScreenshot.lastObject
        if (image != nil) {
            appDelegate.gestureBaseView?.imgView?.image = image as! UIImage?;
        }
        return super.popViewController(animated: animated)
    }
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if (arrayScreenshot.count > 2) {
            arrayScreenshot.removeObjects(in: NSMakeRange(1, arrayScreenshot.count - 1))
        }
        let image = arrayScreenshot.lastObject
        if (image != nil) {
            appDelegate.gestureBaseView?.imgView?.image = image as! UIImage?
        }
        return super.popToRootViewController(animated: animated)
    }
    
    @discardableResult
    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        let arr = super.popToViewController(viewController, animated: animated)
        if (self.arrayScreenshot.count > (arr?.count)!) {
            for _ in 0  ..< (arr?.count)! {
                arrayScreenshot.removeLastObject()
            }
        }
        return arr;
    }
}
