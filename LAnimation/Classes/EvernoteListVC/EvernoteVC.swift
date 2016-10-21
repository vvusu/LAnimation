//
//  EvernoteVC.swift
//  LAnimation
//
//  Created by vvusu on 10/21/16.
//  Copyright © 2016 vvusu. All rights reserved.
//

import UIKit

public protocol EvernoteVCDelegate:NSObjectProtocol {
    func didClickGoBack()
}

class EvernoteVC: UIViewController {
    
    internal weak var delegate: EvernoteVCDelegate?
    internal var domainColor:UIColor = UIColor()
    internal var titleName:String = ""
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalView.layer.masksToBounds = true
        totalView.layer.cornerRadius = 5.0
        totalView.backgroundColor = domainColor
        titleLabel.text = titleName
        textView.contentOffset = CGPoint.init(x: 0, y: 0)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTapGesture(_:)))
        
        self.totalView.addGestureRecognizer(tap)
    }
    
    func handleTapGesture(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func goBack(_ sender: AnyObject) {
        if ((delegate?.responds(to: Selector(("didClickGoBack:")))) != nil) {
            delegate?.didClickGoBack()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
