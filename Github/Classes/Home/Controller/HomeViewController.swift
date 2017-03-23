//
//  HomeViewController.swift
//  Github
//
//  Created by jewelz on 2017/3/23.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UITableViewController {
    
    lazy var refreshCtr: UIRefreshControl? = {
        let refresh = UIRefreshControl()
        refresh.attributedTitle = NSAttributedString(string: "加载中...")
        refresh.addTarget(self, action: #selector(HomeViewController.startRefresh(_:)), for: .valueChanged)
        return refresh
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 120
        tableView.register(RepoCell.nib, forCellReuseIdentifier: RepoCell.reuseIdentifier)
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshCtr
        } else {
            // Fallback on earlier versions
            tableView.tableHeaderView = refreshCtr
        }
        
       // refreshCtr?.beginRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoCell.reuseIdentifier, for: indexPath)

        // Configure the cell...

        return cell
    }
    
    // MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(UIViewController(), animated: true)
    }

    // MARK: - Action
    
    func startRefresh(_ sender: UIRefreshControl) {
        
        let repos_url = UserManager.shared.user?.repos_url
        Alamofire.request(repos_url!).responseJSON { response in
            
            guard let json = response.result.value as? [Any] else {
                return
            }
            
            debugPrint(json)
            
            let repos: [Repos] = (json ~> Repos.self)!
            
            debugPrint(repos)
            
            sender.endRefreshing()
        }
        
       
    }

    

}
