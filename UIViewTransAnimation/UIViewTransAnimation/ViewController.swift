//
//  ViewController.swift
//  UIViewTransAnimation
//
//  Created by 杨峰 on 2018/1/12.
//  Copyright © 2018年 BerryBit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animationView : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView = UIView.init(frame: CGRect.init(x: 20, y: 100, width: 280, height: 300))
        animationView?.backgroundColor = UIColor.red
        self.view.addSubview(animationView!)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        UIView.transition(with: animationView!, duration: 3, options: .transitionFlipFromLeft, animations: {
//            // 这里可以进行视图上的重构
//        }, completion: nil)
        
        let otherView = UIView.init(frame: CGRect.init(x: 20, y: 100, width: 280, height: 300))
        otherView.backgroundColor = UIColor.blue
        
        UIView.transition(from: animationView!, to: otherView, duration: 3, options: .transitionCurlUp, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

