//
//  ViewController.swift
//  CAAniamtionTest
//
//  Created by 杨峰 on 2018/1/15.
//  Copyright © 2018年 BerryBit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // 1、CABasicAnimation类
//        self.class_1()
//
//        // 2、CAKeyframeAnimation 类
//        self.class_2()
//
//        // 3、CASpingAnimation 类
//        self.class_3()
        
    }
    
    // 3、CASpingAnimation 类
    func class_3() {
        let springAni = CASpringAnimation.init(keyPath: "position.y")
        // 模拟重物质量，必须大于0，默认为1，会影响惯性
        springAni.mass = 2
        // 模拟弹簧劲度系数，必须大于0，这个值越大，回弹越快
        springAni.stiffness = 5
        // 设置阻尼系数，必须大于0，这个值越大，回弹的幅度越小
        springAni.damping = 2
        springAni.toValue = 300
        springAni.duration = 3
        // 创建演示动画的Layer
        let layer = CALayer()
        layer.position = CGPoint.init(x: 100, y: 100)
        layer.bounds = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        layer.backgroundColor = UIColor.red.cgColor
        self.view.layer.addSublayer(layer)
        layer.add(springAni, forKey: "")
    }

    // 2、CAKeyframeAnimation 类
    func class_2() {
        let keyframeAni = CAKeyframeAnimation.init(keyPath: "transform.rotation.z")
        keyframeAni.values = [NSNumber.init(value: 0), NSNumber.init(value: Double.pi / 4), NSNumber.init(value: 0), NSNumber.init(value: Double.pi)]
        keyframeAni.duration = 3
        self.view.layer.add(keyframeAni, forKey: nil)
    }
    
    
    // 1、CABasicAnimation类
    func class_1() {
        // 创建动画实例， keyPath为要进行属性动画的属性路径
        let basicAni = CABasicAnimation.init(keyPath: "transform.rotation.z")
        // 从 0 度开始旋转
        basicAni.fromValue = NSNumber.init(value: 0)
        // 旋转到 180 度
        basicAni.toValue = NSNumber.init(value: Double.pi)
        // 设置动画播放的时长
        basicAni.duration = 2
        // 将动画作用于当前界面的视图Layer层上
        self.view.layer.add(basicAni, forKey: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        // 1、CATransition 类
//        self.class_4()
        
        // 2、 CAAnimationGroup 类
        self.class_5()
    }
    
    // 2、 CAAnimationGroup 类
    func class_5() {
        let basciAni = CABasicAnimation.init(keyPath: "backgroundColor")
        basciAni.toValue = UIColor.green.cgColor
        
        let basicAni2 = CABasicAnimation.init(keyPath: "transform.scale.x")
        basicAni2.toValue = NSNumber.init(value: 2)
        
        let grounpAni = CAAnimationGroup()
        grounpAni.animations = [basciAni, basicAni2]
        grounpAni.duration = 3
        
        let layer = CALayer()
        layer.position = CGPoint.init(x: 100, y: 100)
        layer.bounds = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        layer.backgroundColor = UIColor.red.cgColor
        layer.add(grounpAni, forKey: "")
        self.view.layer.addSublayer(layer)
    }
    
    // 1、CATransition 类
    func class_4() {
        let transAni = CATransition()
        transAni.type = kCATransitionPush
        transAni.subtype = kCATransitionFromTop
        
        let layer = CALayer()
        layer.position = CGPoint.init(x: 100, y: 100)
        layer.bounds = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        layer.backgroundColor = UIColor.red.cgColor
        layer.add(transAni, forKey: "")
        self.view.layer.addSublayer(layer)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

