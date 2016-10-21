//
//  LNPageLine.swift
//  LNAnimation
//
//  Created by vvusu on 7/6/16.
//  Copyright © 2016 vvusu. All rights reserved.
//

import UIKit

class LNPageLine: CALayer {

    // page的个数
    var pageCount = 6
    
    //选中的item  1,2,3,4
    var selectedPage = 1
    
    //是否开启进度显示
    var shouldShowProgressLine = true
    
    // pageControl线的高度
    var lineHeight = 2.0
    
    //小球的直径
    var ballDiameter = 10
    
    //未选中的颜色
    var unSelectedColor = UIColor.green
    
    //选中的颜色
    var selectedColor = UIColor.red
    
    //选中的长度
    var selectedLineLength = 5
    
    //绑定的滚动视图
    var bindScrollView : UIScrollView?
    
    // 记录上一次的contentOffSet.x
    var lastContentOffsetX = 0
    
    // 记录上一次选中的长度
    var initialSelectedLineLength = 0
    
    //MARK: - 方法
    
    //直线动画接口:传入目标index作为参数
    internal func animateSelectedLineToNewIndex(_ newIndex: Int) {
        
    }
    
    //直线动画接口:传入绑定scrollView作为参数
    internal func animateSelectedLineWithScrollView(_ scrollView: UIScrollView) {
        
    }
    
}
