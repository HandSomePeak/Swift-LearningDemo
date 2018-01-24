//
//  ViewController.swift
//  GIFAnimation
//
//  Created by 杨峰 on 2018/1/12.
//  Copyright © 2018年 BerryBit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var GIF : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("viewDidLoad")
        GIF = UIImageView.init(frame: CGRect.init(x: 100, y: 100, width: 200, height: 200))
        self.playGIFOnImageView(name: "kss", imageview: GIF!)
        self.view.addSubview(GIF!)
    }
    
    func playGIFOnImageView(name:String, imageview: UIImageView) {
        // 创建素材路径
        let path = Bundle.main.path(forResource: name, ofType: ".gif")
        // 通过路径创建素材URL
        let url = URL.init(fileURLWithPath: path!)
        // 创建素材实例
        let source = CGImageSourceCreateWithURL(url as CFURL, nil)
        // 获取素材中图片的张数
        let count = CGImageSourceGetCount(source!)
        // 创建数组用于存放所有图片
        var imageArray = Array<UIImage>()
        // 创建数组用于存放图片的宽度
        var imagesWidth = Array<Int>()
        // 创建数组用于存放图片的高度
        var imagesHeight = Array<Int>()
        // 用于存放GIF播放时长
        var time: Int = Int()
        // 遍历素材
        for index in 0..<count {
            // 从素材实例中获取图片
            let image = CGImageSourceCreateImageAtIndex(source!, index, nil)
            // 将图片加入数组中
            imageArray.append(UIImage.init(cgImage: image!))
            // 获取图片信息数组
            let info = CGImageSourceCopyPropertiesAtIndex(source!, index, nil) as! Dictionary<String, AnyObject>
            // 获取宽高
            let width = Int(truncating: info[kCGImagePropertyPixelWidth as String]! as! NSNumber)
            let height = Int(truncating: info[kCGImagePropertyPixelHeight as String]! as! NSNumber)
            imagesWidth.append(width)
            imagesHeight.append(height)
            // 获取时间信息
            let timeDic = info[kCGImagePropertyGIFDictionary as String] as! Dictionary<String, AnyObject>
            // 进行时间累加
            time += Int(truncating: timeDic[kCGImagePropertyGIFDelayTime as String] as! NSNumber)
        }
        
        // 重设imageview尺寸
        // 由于大部分GIF文件中的图片尺寸相同，这里随便取一个即可
        imageview.frame = CGRect.init(x: 0, y: 100, width: imagesWidth[0], height: imagesHeight[0])
        
        // 进行动画播放
        imageview.animationImages = imageArray
        imageview.animationDuration = TimeInterval(time)
        imageview.animationRepeatCount = 0
        imageview.startAnimating()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

