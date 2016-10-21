//
//  LNIndicator.swift
//  LNAnimation
//
//  Created by vvusu on 7/6/16.
//  Copyright © 2016 vvusu. All rights reserved.
//

import UIKit

enum ScrollDirection {
    case None
    case Right
    case Left
    case Up
    case Down
    case Crazy
}

class LNIndicator: CALayer {
    
    var indicatorSize: Int {
        get {
            return self.indicatorSize
        }
        set {
            if indicatorSize != newValue {
                self.indicatorSize = newValue
            }
        }
    }
    var lastContentOffset = 0
    var currentRect = CGRect.init()
    var indicatorColor = UIColor.red
    var scrollDirection :ScrollDirection = .None
    
    
    internal func animateIndicatorWithScrollView(_ scrollView: UIScrollView, indicator pgctl: LNAnimatedPageControl) {
        
    }
    
    internal func restoreAnimation(_ howmanydistance: AnyObject) {
        
    }
}
