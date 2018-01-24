//
//  DataViewController.swift
//  UIPageViewControllerTestDemo
//
//  Created by 杨峰 on 2018/1/12.
//  Copyright © 2018年 BerryBit. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    var dataLabel : UILabel!

    var dataObject : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.CreateTitle()
    }
    
    func CreateTitle() -> Void {
        
        let view_w = self.view.frame.size.width
        //let view_h = self.view.frame.size.height
        
        self.view.backgroundColor = UIColor.yellow
        
        self.dataLabel = UILabel.init(frame: CGRect.init(x: 0, y: 64, width: view_w, height: 21))
        self.dataLabel.textAlignment = NSTextAlignment.center
        self.dataLabel.textColor = UIColor.black
        self.view .addSubview(self.dataLabel)
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataLabel.text = dataObject
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
