//
//  ViewController.swift
//  UIViewAnimation
//
//  Created by 杨峰 on 2018/1/12.
//  Copyright © 2018年 BerryBit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animationView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView = UIView.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        animationView?.backgroundColor = UIColor.red
        self.view.addSubview(animationView!)
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        // 1.
//        UIView.animate(withDuration: 1.0) {
//            self.animationView?.backgroundColor = UIColor.blue
//        }
        NSLog("yuahjhk");
        // 2.
//        UIView.animate(withDuration: 1.0, animations: {
//            self.animationView?.backgroundColor = UIColor.blue
//        }) { (finish) in
//            UIView.animate(withDuration: 2, animations: {
//                self.animationView?.center = CGPoint.init(x: 150, y: 300)
//            })
//        }
        // 3.
//        UIView.animate(withDuration: 2, delay: 2, options: [UIViewAnimationOptions.repeat], animations: {
//            self.animationView?.backgroundColor = UIColor.blue
//        }, completion: nil)
        // 4
        UIView.animate(withDuration: 10.0, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.7, options: [], animations: {
            self.animationView?.center = CGPoint.init(x: 150, y: 350)
        }, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

