//
//  LNAnimatedPageControl.swift
//  LNAnimation
//
//  Created by vvusu on 7/6/16.
//  Copyright © 2016 vvusu. All rights reserved.
//

import UIKit

enum PageControlStyle {
    case Circle
    case Rect
}

class LNAnimatedPageControl: UIView {
    
    // page的个数 The count of all pages
    var pageCount = 0
    
    // 第一次显示的page
    var selectedPage = 1
    
    // Indicator大小
    var indicatorSize = 20;
    
    // 选中的颜色
    var selectedColor = UIColor.red
    
    // 未选中的颜色
    var unSelectedColor = UIColor.white
    
    // 绑定的滚动视图
    var bindScrollView : UIScrollView?
    
    // Possible to swipe (Pan gesture recognize)
    var swipeEnable = true;
    
    // 是否显示填充进度条
    var shouldShowProgressLine = true
    
    // 直线Layer
    var line : LNPageLine = LNPageLine()
    
    // Indicator 只读!  Readonly!
    var indicator : LNIndicator = LNIndicator()
    
    // Indicator样式
    var pageControlStyle : PageControlStyle = .Circle
    
    // MARK: - 方法
    
    // Animate to index
    internal func animateToIndex(_ index: Int) {
    
    }
}
