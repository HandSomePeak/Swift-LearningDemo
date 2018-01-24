//
//  ModelController.swift
//  UIPageViewControllerTestDemo
//
//  Created by 杨峰 on 2018/1/12.
//  Copyright © 2018年 BerryBit. All rights reserved.
//

import UIKit

class ModelController: NSObject , UIPageViewControllerDataSource{

    var pageData : [String] = []
    
    override init() {
        super.init()
        let dataFormatter = DateFormatter()
        pageData = dataFormatter.monthSymbols
    }
    
    func viewControllerAtIndex(_ index: Int, viewController: UIViewController) -> DataViewController? {
        if self.pageData.count == 0 || index >= self.pageData.count {
            return nil
        }

        let dataViewController = DataViewController()
        dataViewController.dataObject = self.pageData[index]
        return dataViewController
    }
    
    func indexOfViewController(_ viewController: DataViewController) -> Int {
        return pageData.index(of: viewController.dataObject) ?? NSNotFound
    }
    
    // MARK: - Page View Controller Data Source
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if index == 0 || index == NSNotFound {
            return nil
        }
        index -= 1
        return self.viewControllerAtIndex(index, viewController: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if index == NSNotFound {
            return nil
        }
        index += 1
        if index == self.pageData.count {
            return nil
        }
        return self.viewControllerAtIndex(index, viewController: viewController)
    }
    
    
}
