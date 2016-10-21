//
//  EvernoteVC.swift
//  LAnimation
//
//  Created by vvusu on 10/21/16.
//  Copyright © 2016 vvusu. All rights reserved.
//

import UIKit

class EvernoteListCell: UICollectionViewCell {
    @IBOutlet internal weak var titleLine: UIView!
    @IBOutlet internal weak var titleLabel: UILabel!
    @IBOutlet internal weak var textView: UITextView!
    @IBOutlet internal weak var backButton: UIButton!
    @IBOutlet internal weak var labelLeadCons: NSLayoutConstraint!
    internal var horizonallyCons = NSLayoutConstraint()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5.0
        self.horizonallyCons = NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0.0)
    }

}
