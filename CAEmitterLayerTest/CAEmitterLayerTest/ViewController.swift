//
//  ViewController.swift
//  CAEmitterLayerTest
//
//  Created by 杨峰 on 2018/1/15.
//  Copyright © 2018年 BerryBit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        
        self.view.backgroundColor = UIColor.black
        
        let fireEmitter = CAEmitterLayer()
        fireEmitter.emitterPosition = CGPoint.init(x: width / 2.0, y: height - 20)
        fireEmitter.emitterSize = CGSize.init(width: width - 100, height: 20)
        fireEmitter.renderMode = kCAEmitterLayerAdditive
        
        let fireCell = CAEmitterCell()
        fireCell.birthRate  = 1500
        fireCell.lifetime = 3.0
        fireCell.lifetimeRange = 1.5
        fireCell.color = UIColor.init(red: 0.8, green: 0.4, blue: 0.2, alpha: 1.0).cgColor
        fireCell.contents = UIImage.init(named: "emtter")?.cgImage
        fireCell.velocity = 120
        fireCell.velocityRange = 60
        fireCell.emissionLongitude = CGFloat(Double.pi + Double.pi / 2)
        fireCell.emissionRange = CGFloat(Double.pi / 2)
        fireCell.scaleSpeed = 0.5
        
        let smokeCell = CAEmitterCell()
        smokeCell.birthRate = 1000
        smokeCell.lifetime = 4.0
        smokeCell.lifetimeRange = 1.5
        smokeCell.color = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.05).cgColor
        smokeCell.contents = UIImage.init(named: "emtter")?.cgImage
        smokeCell.velocity = 200
        smokeCell.velocity = 100
        smokeCell.emissionLongitude = CGFloat.init(Double.pi + Double.pi / 2)
        smokeCell.emissionRange = CGFloat.init(Double.pi / 2)
        
        fireEmitter.emitterCells = [fireCell, smokeCell]
        self.view.layer.addSublayer(fireEmitter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

