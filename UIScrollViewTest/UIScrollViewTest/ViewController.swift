//
//  ViewController.swift
//  UIScrollViewTest
//
//  Created by 杨峰 on 2018/1/10.
//  Copyright © 2018年 BerryBit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var imv : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scroll = UIScrollView.init(frame: self.view.frame)
        self.view.addSubview(scroll)
        
        scroll.delegate = self
        
        imv = UIImageView.init(image: UIImage.init(named: "womanImage"))
        imv?.frame = self.view.frame
        imv?.contentMode = UIViewContentMode.scaleAspectFit
        scroll.addSubview(imv!)
        scroll.contentSize = self.view.frame.size
        
        scroll.minimumZoomScale = 0.2
        scroll.maximumZoomScale = 20.0
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imv!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

