//
//  AnimatedListVC.swift
//  LAnimation
//
//  Created by vvusu on 10/20/16.
//  Copyright © 2016 vvusu. All rights reserved.
//

import UIKit

class AnimatedListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var dataArr = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        dataArr = ["AnimatedPageControl","EvernoteListVC",""]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - UITableView datasource and delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dataArr[indexPath.row] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let story = UIStoryboard.init(name: "Main", bundle:Bundle.main)
            let pageControlVC = story.instantiateViewController(withIdentifier: "PageControlVC")
            self.navigationController?.pushViewController(pageControlVC, animated: true)
            break
        case 1:
            let evernoteListVC = EvernoteListVC()
            self.navigationController?.pushViewController(evernoteListVC, animated: true)
            break
        default: break
        }
    }

}
