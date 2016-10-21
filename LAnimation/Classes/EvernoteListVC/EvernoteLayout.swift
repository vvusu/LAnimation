//
//  EvernoteLayout.swift
//  LAnimation
//
//  Created by vvusu on 10/21/16.
//  Copyright © 2016 vvusu. All rights reserved.
//

import UIKit

public let screenWidth = UIScreen.main.bounds.size.width
public let screenHeight = UIScreen.main.bounds.size.height
public let verticallyPadding:CGFloat = 10
public let horizonallyPadding:CGFloat = 10
public let cellWidth = screenWidth - 2 * horizonallyPadding

private let cellHeight:CGFloat = 45
private let SpringFactor:CGFloat = 10.0

class EvernoteLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        itemSize = CGSize.init(width: cellWidth, height: cellHeight)
        headerReferenceSize =  CGSize.init(width: screenWidth, height: verticallyPadding)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        itemSize = CGSize.init(width: cellWidth, height: cellHeight)
        headerReferenceSize = CGSize.init(width: screenWidth, height: verticallyPadding)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let offsetY = self.collectionView!.contentOffset.y
        let attrsArray = super.layoutAttributesForElements(in: rect)
        let collectionViewFrameHeight = self.collectionView!.frame.size.height;
        let collectionViewContentHeight = self.collectionView!.contentSize.height;
        let ScrollViewContentInsetBottom = self.collectionView!.contentInset.bottom;
        let bottomOffset = offsetY + collectionViewFrameHeight - collectionViewContentHeight - ScrollViewContentInsetBottom
        let numOfItems = self.collectionView!.numberOfSections
        
        for attr:UICollectionViewLayoutAttributes in attrsArray! {
            if (attr.representedElementCategory == UICollectionElementCategory.cell) {
                var cellRect = attr.frame;
                if offsetY <= 0 {
                    let distance = fabs(offsetY) / SpringFactor;
                    cellRect.origin.y += offsetY + distance * CGFloat(attr.indexPath.section + 1);
                } else if bottomOffset > 0 {
                    let distance = bottomOffset / SpringFactor;
                    cellRect.origin.y += bottomOffset - distance *
                        CGFloat(numOfItems - attr.indexPath.section)
                }
                attr.frame = cellRect;
            }
        }
        return attrsArray;
    }
}
