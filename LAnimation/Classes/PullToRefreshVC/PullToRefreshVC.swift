//
//  PullToRefreshVC.swift
//  LAnimation
//
//  Created by vvusu on 10/21/16.
//  Copyright © 2016 vvusu. All rights reserved.
//

import UIKit

class PullToRefreshVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var timer: Timer!
    var customView: UIView!
    var tableView: UITableView!
    var isAnimating = false
    var currentColorIndex = 0
    var currentLabelIndex = 0
    var refreshControl: UIRefreshControl!
    var labelsArray: Array<UILabel> = []
    var dataArray: Array<String> = ["One", "Two", "Three", "Four", "Five"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PullToRefreshCell")
        
        refreshControl = UIRefreshControl()
        refreshControl.backgroundColor = UIColor.clear
        refreshControl.tintColor = UIColor.clear
        tableView.addSubview(refreshControl)
        
        loadCustomRefreshContents()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCustomRefreshContents() {
        let refreshContents = Bundle.main.loadNibNamed("RefreshContents", owner: self, options: nil)
        customView = refreshContents?[0] as! UIView
        customView.frame = refreshControl.bounds
        
        for i in 0 ..< customView.subviews.count {
            labelsArray.append(customView.viewWithTag(i + 1) as! UILabel)
        }
        
        refreshControl.addSubview(customView)
    }
    
    func animateRefreshStep1() {
        isAnimating = true
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
            self.labelsArray[self.currentLabelIndex].transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
            self.labelsArray[self.currentLabelIndex].textColor = self.getNextColor()
            }, completion: { (finished) -> Void in
                UIView.animate(withDuration: 0.05, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
                    self.labelsArray[self.currentLabelIndex].transform = .identity
                    self.labelsArray[self.currentLabelIndex].textColor = UIColor.black
                    }, completion: { (finished) -> Void in
                        self.currentLabelIndex += 1
                        if self.currentLabelIndex < self.labelsArray.count {
                            self.animateRefreshStep1()
                        }
                        else {
                            self.animateRefreshStep2()
                        }
                })
        })
    }
    
    func animateRefreshStep2() {
        UIView.animate(withDuration: 0.35, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
            self.labelsArray[0].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[1].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[2].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[3].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[4].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            
            }, completion: { (finished) -> Void in
                UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
                    self.labelsArray[0].transform = .identity
                    self.labelsArray[1].transform = .identity
                    self.labelsArray[2].transform = .identity
                    self.labelsArray[3].transform = .identity
                    self.labelsArray[4].transform = .identity
                    
                    }, completion: { (finished) -> Void in
                        if self.refreshControl.isRefreshing {
                            self.currentLabelIndex = 0
                            self.animateRefreshStep1()
                        }
                        else {
                            self.isAnimating = false
                            self.currentLabelIndex = 0
                            for i in 0 ..< self.labelsArray.count {
                                self.labelsArray[i].textColor = UIColor.black
                                self.labelsArray[i].transform = .identity
                            }
                        }
                })
        })
    }
    
    func doSomething() {
        timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(PullToRefreshVC.endOfWork), userInfo: nil, repeats: true)
    }
    
    func endOfWork() {
        refreshControl.endRefreshing()
        timer.invalidate()
        timer = nil
    }
    
    func getNextColor() ->UIColor {
        var colorsArray: Array<UIColor> = [UIColor.magenta, UIColor.brown, UIColor.yellow, UIColor.red, UIColor.green, UIColor.blue, UIColor.orange]
        
        if currentColorIndex == colorsArray.count {
            currentColorIndex = 0
        }
        
        let returnColor = colorsArray[currentColorIndex]
        currentColorIndex += 1
        
        return returnColor
    }
    
    //MARK: UIScrollView delegate method implementation
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if refreshControl.isRefreshing {
            if !isAnimating {
                doSomething()
                animateRefreshStep1()
            }
        }
    }
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PullToRefreshCell", for: indexPath as IndexPath)
        cell.textLabel!.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
