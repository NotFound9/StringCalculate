//
//  ViewController.swift
//  StringCalculate
//
//  Created by ruiwendaier on 2018/12/7.
//  Copyright © 2018年 瑞文戴尔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = StringCalculateManager.shared
        
        oldWay(value: 1)
        newWay(value: 1)
        
        oldWay(value: 10)
        newWay(value: 10)
        
        oldWay(value: 100)
        newWay(value: 100)
        
        oldWay(value: 1000)
        newWay(value: 1000)
        
        oldWay(value: 10000)
        newWay(value: 10000)
        
        oldWay(value: 100000)
        newWay(value: 100000)

        oldWay(value: 1000000)
        newWay(value: 1000000)
        
        print("测试完成")
    }

    func oldWay(value: Int) {
        let attribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
        let constraintRect = CGSize.init(width: 100, height: 60)
        
        var title = ""
        var rect = CGRect.zero
        print("oldWay开始计算了")
        let startTime = CFAbsoluteTimeGetCurrent();
        for i in 0...value {
            title = "iOS性能优化之计算多行Label高度的新方法\(i)"
            rect = title.boundingRect(with: constraintRect,
                                                 options: .usesLineFragmentOrigin,
                                                 attributes: attribute,
                                                 context: nil)
        }
        let duration = (CFAbsoluteTimeGetCurrent() - startTime) * 1000.0;
        print("使用oldWay计算\(value)次，总耗时\(duration) ms")
    }
    
    func newWay(value: Int) {
        let constraintRect = CGSize.init(width: 100, height: 60)
        var title = ""
        var rect = CGRect.zero
        print("newWay开始计算了")
        let startTime = CFAbsoluteTimeGetCurrent();
        for i in 0...value {
            title = "iOS性能优化之计算多行Label高度的新方法\(i)"
            rect = title.boundingRectFast(withMaxSize: constraintRect, font: UIFont.boldSystemFont(ofSize: 16))
        }
        let duration = (CFAbsoluteTimeGetCurrent() - startTime) * 1000.0;
        print("使用newWay计算\(value)次，总耗时\(duration) ms")
    }
}

