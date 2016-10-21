//
//  EvernoteListVC.swift
//  LAnimation
//
//  Created by vvusu on 10/20/16.
//  Copyright © 2016 vvusu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "EvernoteListCell"
private let topPadding:CGFloat = 64
public let BGColor = UIColor(red: 56.0/255.0, green: 51/255.0, blue: 76/255.0, alpha: 1.0)

class EvernoteListVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    private let colorArray = NSMutableArray()
    private let rowNumber = 15
    private let customTransition = EvernoteTransition()
    private let collectionView = UICollectionView(frame: CGRect(x: 0, y: topPadding, width: screenWidth, height: screenHeight - topPadding), collectionViewLayout: EvernoteLayout())
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = BGColor
        collectionView.backgroundColor = BGColor
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = false
        collectionView.contentInset = UIEdgeInsetsMake(0, 0, verticallyPadding, 0);
        
        self.view.addSubview(collectionView)
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        
        // 160 arc4random() % 360
        let random = arc4random() % 360
        for index in 0 ..< rowNumber {
            let hue = Float((Int(random) + index * 6) % 360) / 360.0
            let color = UIColor.init(hue: CGFloat(hue), saturation: 0.7, brightness: 1.0, alpha: 1.0)
            colorArray.add(color)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
         return colorArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EvernoteListCell
        cell.backgroundColor = colorArray.object(at: colorArray.count - 1 - indexPath.section) as? UIColor
        cell.titleLabel.text = "Notebook " + String(indexPath.section + 1)
        cell.titleLine.alpha = 0.0
        cell.textView.alpha = 0.0
        cell.backButton.alpha = 0.0
        cell.tag = indexPath.section
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath as IndexPath) as! EvernoteListCell
        let visibleCells = collectionView.visibleCells as! [EvernoteListCell]
        let storyBoard = UIStoryboard(name: "Evernote", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "Note") as! EvernoteVC
        viewController.titleName = cell.titleLabel.text!
        viewController.domainColor = cell.backgroundColor!
        
        let finalFrame = CGRect.init(x: 10, y: collectionView.contentOffset.y + 10, width: screenWidth - 20, height: screenHeight - 40)
        self.customTransition.EvernoteTransitionWith(selectCell: cell, visibleCells: visibleCells, originFrame: cell.frame, finalFrame: finalFrame, panViewController:viewController, listViewController: self)
        viewController.transitioningDelegate = self.customTransition
        viewController.delegate = self.customTransition
        self.present(viewController, animated: true) { () -> Void in
        }
    }
    
}
