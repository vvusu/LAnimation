//
//  PageControlVC.swift
//  LNAnimation
//
//  Created by vvusu on 7/6/16.
//  Copyright © 2016 vvusu. All rights reserved.
//

import UIKit

class PageControlVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var numCollectionView: UICollectionView!
    var pageControl : LNAnimatedPageControl = LNAnimatedPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.frame = CGRect(x: 0, y: self.view.frame.height - 100, width: self.view.frame.width, height: 50)
        pageControl.pageCount = 8
        pageControl.indicatorSize = 20
        pageControl.selectedColor = UIColor.red
        pageControl.unSelectedColor = UIColor.white
        pageControl.bindScrollView = numCollectionView
        pageControl.swipeEnable = true
        pageControl.shouldShowProgressLine = true
        self.view.addSubview(pageControl)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func animateToPage(_ sender: AnyObject) {
        pageControl.animateToIndex(5)
    }

    @IBAction func switchChanged(_ sender: AnyObject) {
        pageControl.swipeEnable = sender.isOn
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageControl.pageCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"PageControlCell", for: indexPath) as! PageControlCell
        cell.cellNumLabel.text = String.init(stringInterpolationSegment: indexPath.item + 1)
        return cell
    }
    
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
    }
}
