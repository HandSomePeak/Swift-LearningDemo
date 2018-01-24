//
//  ViewController.swift
//  WebKitTwst
//
//  Created by 杨峰 on 2018/1/10.
//  Copyright © 2018年 BerryBit. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var wkview : WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        // 创建网页配置
        let configuration = WKWebViewConfiguration()
        // 对网页视图进行实例化
        wkview = WKWebView(frame: self.view.frame, configuration: configuration)
        self.view.addSubview(wkview!)
        let url = URL.init(string: "http://www.baidu.com")
        let request = URLRequest.init(url: url!)
        wkview!.load(request)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

