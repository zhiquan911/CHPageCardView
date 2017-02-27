//
//  ViewController.swift
//  CHPageCardView
//
//  Created by zhiquan911 on 02/27/2017.
//  Copyright (c) 2017 zhiquan911. All rights reserved.
//

import UIKit
import CHPageCardView

class ViewController: UIViewController {
    
    @IBOutlet var pageCardView: CHPageCardView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageCardView.delegate = self
        self.pageCardView.register(nib: UINib(nibName: PageCardCell.cellIdentifier, bundle: nil),
                                   forCellWithReuseIdentifier: PageCardCell.cellIdentifier)
        
        //默认取xib组件上设置的值，但也可以使用代码设置每个单元格的尺寸
        //self.pageCardView.fixCellSize = CGSize(width: 260, height: 170)
        
        //使用固定的内间距控制单元格的大小，这样可以做到不同手机尺寸自动约束布局
        self.pageCardView.fixPadding = UIEdgeInsets(top: 30, left: 20, bottom: 30, right: 20)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: CHPageCardViewDelegate {
    
    func numberOfCards(in pageCardView: CHPageCardView) -> Int {
        return 10
    }
    
    func pageCardView(_ pageCardView: CHPageCardView, cellForIndexAt index: Int) -> UICollectionViewCell {
        let cell = pageCardView.dequeueReusableCell(withReuseIdentifier: PageCardCell.cellIdentifier,
                                                    for: index) as! PageCardCell
        return cell
    }
    
    func pageCardView(_ pageCardView: CHPageCardView, didSelectIndexAt index: Int) {
        
    }
}

