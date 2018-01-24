//
//  ViewController.swift
//  UIWebView
//
//  Created by 杨峰 on 2018/1/9.
//  Copyright © 2018年 BerryBit. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.UIWebViewFunction()
        
        
    }
    
    
    
    // MARK: UIWebView
    func UIWebViewFunction() {
        let view_w = UIScreen.main.bounds.width
        let view_h = UIScreen.main.bounds.height
        
        self.view.backgroundColor = UIColor.white
        let webview = UIWebView.init(frame: CGRect.init(x: 0, y: 0, width: view_w, height: view_h))
        let url = URL.init(string: "http://www.baidu.com")
        let request = URLRequest.init(url: url!)
        webview.loadRequest(request)
        self.view .addSubview(webview)
        
        webview.scrollView.bounces = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

