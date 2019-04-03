//  希望您的举手之劳，能为我点颗赞，谢谢~
//  代码地址: https://github.com/Bonway/BBGestureBack
//  BBGestureBack
//  Created by Bonway on 2016/3/17.
//  Copyright © 2016年 Bonway. All rights reserved.
//

import UIKit

enum BBPopType:Int{
    case viewController = 0
    case toViewController
    case toRootViewController
}

class BBGestureBaseController: UIViewController {

    /**
     用了自定义的手势返回，则系统的手势返回屏蔽
     不用自定义的手势返回，则系统的手势返回启用
     */
    var isEnablePanGesture : Bool
    var blankType: BBPopType
    
    lazy var bbBackBarItem : UIBarButtonItem = {
        
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage(named: "bb_navigation_back"), for: .normal)
        backBtn.imageView?.contentMode = .center
        backBtn.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        backBtn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0)
        
        let bbBackBarItem = UIBarButtonItem(customView: backBtn)
        return bbBackBarItem
    }()
    
    @objc private func dismissSelf(){
        switch blankType {
        case .viewController:
            bb_popViewController()
            break
        case .toRootViewController:
            bb_popToRootViewController()
            break
        
        default:
            break
        }
    
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        isEnablePanGesture = true
        blankType = .viewController;
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        if navigationController?.viewControllers.count ?? 0 > 1 {
            navigationItem.leftBarButtonItem = bbBackBarItem
        }
    }
    
    private func bb_basePopViewController(viewController: UIViewController?,popType: BBPopType) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let rootVC = appDelegate.window?.rootViewController
        let presentedVC = rootVC?.presentedViewController
        appDelegate.gestureBaseView?.isHidden = false;
        
        appDelegate.gestureBaseView?.maskedView?.backgroundColor = UIColor.init(hue: 0, saturation: 0, brightness: 0, alpha: kBBMaskingAlpha)
        appDelegate.gestureBaseView?.imgView?.transform = CGAffineTransform(scaleX: kBBWindowToScale, y: kBBWindowToScale);
        
        
        UIView.animate(withDuration: kBBGestureSpeed, animations: {
            rootVC?.view.transform = CGAffineTransform(translationX: (UIScreen.main.bounds.size.width), y: 0);
            presentedVC?.view.transform = CGAffineTransform(translationX: (UIScreen.main.bounds.size.width), y: 0);
        }) { (finished) in
            switch popType {
                case .viewController:
                    self.navigationController?.popViewController(animated: false)
                case .toViewController:
                    self.navigationController?.popToViewController(viewController!, animated: false)
                case .toRootViewController:
                    self.navigationController?.popToRootViewController(animated: false)
            }
            rootVC?.view.transform = CGAffineTransform.identity;
            presentedVC?.view.transform = CGAffineTransform.identity;
            appDelegate.gestureBaseView?.isHidden = true;
        }
        
    }
    
    
    
    func bb_popViewController() {
        
        self.bb_basePopViewController(viewController: nil, popType: BBPopType.viewController)
    }
    
    func bb_popToViewController(viewController: UIViewController) {
        
        self.bb_basePopViewController(viewController: viewController, popType: BBPopType.toViewController)
    }
    
    func bb_popToRootViewController() {
        
        self.bb_basePopViewController(viewController: nil, popType: BBPopType.toRootViewController)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


class BBGestureBaseView: UIView {
    var imgView : UIImageView?
    var maskedView : UIView?
    var arrayImage : NSMutableArray?
    var rootControllerView: UIView?
    static var bbListenTabbarViewMove = Array("bbListenTabbarViewMove");
    
    override init(frame:CGRect){
        super.init(frame: frame)
        arrayImage = NSMutableArray.init()
        backgroundColor = UIColor.black
        imgView = UIImageView.init(frame: self.bounds)
        
        if (bb_IsIphone && kBBIsOpenIphoneXStyle) {
            imgView!.layer.masksToBounds = true;
            imgView!.layer.cornerRadius = kBBIphoneXStyleCorner;
        }
        
        maskedView = UIView.init(frame: self.bounds)
        maskedView?.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.4)
        self.addSubview(imgView!)
        self.addSubview(maskedView!)
        
        addObserver()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (context == &BBGestureBaseView.bbListenTabbarViewMove) {
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
            maskedView?.backgroundColor = UIColor.init(hue: 0, saturation: 0, brightness: 0, alpha: -pt.x / UIScreen.main.bounds.width * 0.4 + 0.4)
            self.imgView?.transform = CGAffineTransform(scaleX: kBBWindowToScale + (pt.x / UIScreen.main.bounds.width * (1 - kBBWindowToScale)), y: kBBWindowToScale + (pt.x / UIScreen.main.bounds.width * (1 - kBBWindowToScale)))
        }
    }
    
    public func restore() {
        if ((maskedView != nil) && (imgView != nil)) {
            maskedView?.backgroundColor = UIColor.init(hue: 0, saturation: 0, brightness: 0, alpha: 0.4)
            imgView?.transform = CGAffineTransform(scaleX: kBBWindowToScale, y: kBBWindowToScale)
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
        imgView?.transform = CGAffineTransform(scaleX: kBBWindowToScale, y: kBBWindowToScale)
    }
    
    public func removeObserver(){
        
        rootControllerView?.removeObserver(self, forKeyPath: "transform", context: &BBGestureBaseView.bbListenTabbarViewMove)
    }
    public func addObserver(){
        rootControllerView = UIApplication.shared.delegate?.window??.rootViewController?.view
        rootControllerView?.addObserver(self, forKeyPath: "transform", options: NSKeyValueObservingOptions.new, context: &BBGestureBaseView.bbListenTabbarViewMove)
    }
    
    deinit {
        removeObserver()
    }
}
