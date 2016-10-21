//
//  AnimatedListVC.swift
//  LAnimation
//
//  Created by vvusu on 10/20/16.
//  Copyright © 2016 vvusu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "AnimatedListCell"
class AnimatedListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var dataArr = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        dataArr = ["AnimatedPageControl","EvernoteList","PullToRefresh"]
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
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
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath as IndexPath)
        cell.textLabel?.text = dataArr[indexPath.row] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc = UIViewController()
        switch indexPath.row {
        case 0:
            let story = UIStoryboard.init(name: "Main", bundle:Bundle.main)
            vc = story.instantiateViewController(withIdentifier: "PageControlVC")
            break
        case 1:
            vc = EvernoteListVC()
            break
        case 2:
            vc = PullToRefreshVC()
            break
        default:
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
