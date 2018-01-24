//
//  ViewController.swift
//  UIPageViewControllerTestDemo
//
//  Created by 杨峰 on 2018/1/12.
//  Copyright © 2018年 BerryBit. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPageViewControllerDelegate{
    // 定义一个分页视图控制器类型的属性
    var pageViewController: UIPageViewController?
    
    var modelController : ModelController {
        if _modelController == nil {
            _modelController = ModelController()
        }
        return _modelController!
    }
    
    var _modelController : ModelController? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 对分页视图控制器进行构造
        // 第一个参数为分页视图控制器的风格，第二个参数为分页视图控制器的切换方向
        self.pageViewController = UIPageViewController.init(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        self.pageViewController?.delegate = self
        
        // 创建一个起始的视图控制器
        let startingViewController : DataViewController = self.modelController.viewControllerAtIndex(0, viewController: self)!
        
        // 将起始视图控制器添加到UIPageViewController的视图控制器组中
        let viewControllers = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in})
        
        // 设置数据源提供者为ModelController对象
        self.pageViewController!.dataSource = self.modelController
        
        // 将分页视图控制器的View添加到当前视图上
        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        
        // 设置分页视图控制器的尺寸
        var pageViewRect = self.view.bounds
        if UIDevice.current.userInterfaceIdiom == .pad {
            pageViewRect = pageViewRect.insetBy(dx: 40, dy: 40)
        }
        self.pageViewController!.view.frame = pageViewRect
        self.pageViewController!.didMove(toParentViewController: self)
        
    }
    
    // MARK: - UIPageViewController delegate methods
    // 设置不同屏幕方向的书脊位置
//    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
//
//        if orientation == .portrait || orientation == .portraitUpsideDown || UIDevice.current.userInterfaceIdiom == .phone {
//
//            let currentViewController = self.pageViewController!.viewControllers![0]
//            let viewControllers = [currentViewController]
//            self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: true, completion: {done in})
//            self.pageViewController!.isDoubleSided = false
//            return .min
//        }
//
//        let currentViewController = self.pageViewController!.viewControllers![0] as! DataViewController
//        var viewControllers: [UIViewController]
//
//        let indexOfCurrentViewController = self.modelController.indexOfViewController(currentViewController)
//        if (indexOfCurrentViewController == 0) || (indexOfCurrentViewController % 2 == 0) {
//            let nextViewController = self.modelController.pageViewController(self.pageViewController!, viewControllerAfter: currentViewController)
//            viewControllers = [currentViewController, nextViewController!]
//        } else {
//            let previousViewController = self.modelController.pageViewController(self.pageViewController!, viewControllerBefore: currentViewController)
//            viewControllers = [previousViewController!, currentViewController]
//        }
//        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: true, completion: {done in })
//
//        return .mid
//
//    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

