//
//  HomeViewController.swift
//  Github
//
//  Created by jewelz on 2017/3/23.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit
import Alamofire
import ModelSwift

class HomeViewController: UITableViewController {
    
    lazy var refreshCtr: UIRefreshControl? = {
        let refresh = UIRefreshControl()
        refresh.attributedTitle = NSAttributedString(string: "加载中...")
        refresh.addTarget(self, action: #selector(HomeViewController.startRefresh(_:)), for: .valueChanged)
        return refresh
    }()
    
    lazy var loadingView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 100, y: 200, width: 64, height: 64))
        imageView.gif(named: "octocat-spinner-128")
        return imageView
    }()
    
    fileprivate var reposes = [Repos]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "nav_search"), style: .plain, target: self, action: #selector(HomeViewController.searchAction))
        
        view.addSubview(loadingView)
        
        tableView.register(RepoCell.nib, forCellReuseIdentifier: RepoCell.reuseIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
        tableView.separatorStyle = .none
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshCtr
        } else {
            // Fallback on earlier versions
            tableView.tableHeaderView = refreshCtr
        }
        
       // refreshCtr?.beginRefreshing()
        fetchData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return reposes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoCell.reuseIdentifier, for: indexPath)as! RepoCell

        cell.configureCell(with: reposes[indexPath.row])

        return cell
    }
    
    // MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = ResopDetailViewController()
        detailVc.repos = reposes[indexPath.row]
        navigationController?.pushViewController(detailVc, animated: true)
    }

    // MARK: - Action
    
    func startRefresh(_ sender: UIRefreshControl) {
        
        fetchData { 
            sender.endRefreshing()
        }
       
    }
    
    func searchAction() {
        present(MainNavigationController(rootViewController: SearchViewController()), animated: false, completion: nil)
    }
    
    // MARK: - Private Methods
    
    private func fetchData(handler: (() -> Void)? = nil) {
        let repos_url = UserManager.shared.user?.repos_url
        Alamofire.request(repos_url!).responseJSON { response in
            
            guard let json = response.result.value as? [Any] else {
                return
            }
            
            //debugPrint(json)
            
            self.reposes = (json => Repos.self)!
        }
    }

}

extension HomeViewController {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let bottomY = Int(tableView.contentSize.height) - Int(tableView.frame.height)
        
       // print("offsetY: \(bottomY), contentoffset: \(Int(tableView.contentOffset.y))")
        if Int(tableView.contentOffset.y) > bottomY {
            print("scroll to bottom")
        }
    }
}
