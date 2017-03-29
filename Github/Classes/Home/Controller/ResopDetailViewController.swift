//
//  ResopDetailViewController.swift
//  Github
//
//  Created by jewelz on 2017/3/27.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit
import Alamofire
import ModelSwift

class ResopDetailViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    var repos = Repos() {
        didSet {
            title = repos.name
            tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Source"
        return cell
    }
    
   // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contentsVc = ContentsViewController()
        contentsVc.title = repos.name
        contentsVc.contentsURLString = repos.contents_url.components(separatedBy: "{+path}").first!
        navigationController?.pushViewController(contentsVc, animated: true)
    }
    
//    private func fetchData(With url: String) {
//        Alamofire.request(url).responseJSON { response in
//            guard let json = response.result.value else {
//                return
//            }
//            debugPrint(json)
//            self.contents = (json => Content.self)!
//            
//        }
//    }
}
