//
//  ViewController.swift
//  UICollectionViewText
//
//  Created by 杨峰 on 2018/1/11.
//  Copyright © 2018年 BerryBit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()

//        // 创建一个普通的集合视图
//        self.CreateCollectionView()
        
        // 创建一个自定义的集合视图
        self.CreateCustomCollectionView()
    }
    
    // MARK: 创建一个自定义的集合视图
    func CreateCustomCollectionView() {
        // 创建集合视图布局类
        let layout = WaterFallLayout.init(itemCount: 30)
        
        // 创建集合视图
        let collectionView = UICollectionView.init(frame: self.view.frame, collectionViewLayout: layout)
        // 设置代理与数据源
        collectionView.delegate = self
        collectionView.dataSource = self
        // 注册数据载体类
        collectionView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "itemId")
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
    }

    // MARK: 创建一个普通的集合视图
    func CreateCollectionView() {
        // 创建集合视图布局类
        let layout = UICollectionViewFlowLayout()
        // 设置每个数据载体的尺寸
        layout.scrollDirection = .vertical//.horizontal//
        // 设置每个数据载体的尺寸
        layout.itemSize = CGSize.init(width: 100, height: 100)
        // 设置最小行间距
        layout.minimumLineSpacing = 30
        // 设置最小列间距
        layout.minimumInteritemSpacing = 50
        // 设置头视图尺寸
        layout.headerReferenceSize = CGSize.init(width: self.view.frame.size.width, height: 20)
        // 设置尾视图尺寸
        layout.footerReferenceSize = CGSize.init(width: self.view.frame.size.width, height: 20)
        // 设置分区边距
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 20)
        
        // 创建集合视图
        let collectionView = UICollectionView.init(frame: self.view.frame, collectionViewLayout: layout)
        // 设置代理与数据源
        collectionView.delegate = self
        collectionView.dataSource = self
        // 注册数据载体类
        collectionView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "itemId")
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
    }
    
    // MARK: 自定义集合视图的协议方法
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemId", for: indexPath)
        // 设置一个随机的颜色
        cell.backgroundColor = UIColor.init(red: CGFloat(arc4random() % 255) / 255, green: CGFloat(arc4random() % 255) / 255, blue: CGFloat(arc4random() % 255) / 255, alpha: 1)
        return cell
    }
    
    
    // MARK: 普通的集合视图的协议方法
    /*
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemId", for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    // 动态设置每个Item的尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row % 2 == 0 {
            return CGSize.init(width: 100, height: 100)
        }
        else {
            return CGSize.init(width: 100, height: 100)
        }
    }
    
    */
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

