//
//  BBGestureBaseController.swift
//  BBGestureBack_Full_swift
//
//  Created by Bonway(黄邦伟) on 2018/4/9.
//  Copyright © 2018年 Bonway. All rights reserved.
//

import UIKit

class BBGestureBaseController: UIViewController {

    /**
     用了自定义的手势返回，则系统的手势返回屏蔽
     不用自定义的手势返回，则系统的手势返回启用
     */
    var isEnablePanGesture : Bool
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        isEnablePanGesture = true
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


class BBGestureBaseView: UIView {
    var imgView : UIImageView?
    var maskedView : UIView?
    var arrayImage : NSMutableArray?
    private var vvListenTabbarViewMove = "vvListenTabbarViewMove"
    
    override init(frame:CGRect){
        super.init(frame: frame)
        arrayImage = NSMutableArray.init()
        backgroundColor = UIColor.black
        imgView = UIImageView.init(frame: self.bounds)
        maskedView = UIView.init(frame: self.bounds)
        maskedView?.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
        self.addSubview(imgView!)
        self.addSubview(maskedView!)
        
        (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController?.view.addObserver(self, forKeyPath: "transform", options: NSKeyValueObservingOptions.new, context: &vvListenTabbarViewMove)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (context == &vvListenTabbarViewMove) {
            let value = change?[NSKeyValueChangeKey.newKey] as! NSValue
            let newTransform = value.cgAffineTransformValue
            showEffectChange(pt: CGPoint(x: newTransform.tx, y: 0))
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public func showEffectChange(pt:CGPoint) {
        if (pt.x > 0) {
            maskedView?.backgroundColor = UIColor.init(hue: 0, saturation: 0, brightness: 0, alpha: -pt.x / 320.0 * 0.4 + 0.4)
            self.imgView?.transform = CGAffineTransform(scaleX: 0.95 + (pt.x / 320.0 * 0.05), y: 0.95 + (pt.x / 320.0 * 0.05))
        }
    }
    
    public func restore() {
        if ((maskedView != nil) && (imgView != nil)) {
            maskedView?.backgroundColor = UIColor.init(hue: 0, saturation: 0, brightness: 0, alpha: 0.4)
            imgView?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }
    
    public func screenShot() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        UIGraphicsBeginImageContextWithOptions(CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), true, 0)
        appDelegate.window?.layer.render(in: UIGraphicsGetCurrentContext()!)
        let viewImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext()
        let imageRef = viewImage?.cgImage
        let sendImage = UIImage.init(cgImage: imageRef!)
        imgView?.image = sendImage
        imgView?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
    }
}
