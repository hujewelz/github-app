//
//  ContentsViewController.swift
//  Github
//
//  Created by jewelz on 2017/3/27.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit
import Alamofire
import ModelSwift

class ContentsViewController: UITableViewController {
    
    var contentsURLString = ""
    
    private var contents = [Content]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ContentCell.self, forCellReuseIdentifier: ContentCell.reuseIdentifier)
        
        fetchData(With: contentsURLString)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contents.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContentCell.reuseIdentifier, for: indexPath) as! ContentCell
        
        let content = contents[indexPath.row]
        cell.titleLabel.text = content.name
        if case content.contentsType = Content.ContentType.file {
            cell.fileImageView.image = #imageLiteral(resourceName: "icon_file")
        }
        else {
            cell.fileImageView.image = #imageLiteral(resourceName: "icon_dir")
        }
        return cell
    }
    
    // MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let content = contents[indexPath.row]
        
        if case content.contentsType = Content.ContentType.file {
            let contentVc = ContentViewController()
            contentVc.title = content.name
            contentVc.url = content.url
            
            navigationController?.pushViewController(contentVc, animated: true)
            return
        }
        
        let contentsVc = ContentsViewController()
        contentsVc.title = content.name
        contentsVc.contentsURLString = content.url
        
        navigationController?.pushViewController(contentsVc, animated: true)
    }
    
    private func fetchData(With url: String) {
        Alamofire.request(url).responseJSON { response in
            guard let json = response.result.value else {
                return
            }
            debugPrint(json)
            self.contents = (json => Content.self)!
            
        }
    }

}
