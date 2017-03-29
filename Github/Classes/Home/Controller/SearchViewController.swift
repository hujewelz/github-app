//
//  SearchViewController.swift
//  Github
//
//  Created by jewelz on 2017/3/29.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit
import Alamofire
import ModelSwift

class SearchViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {

    var searchController: UISearchController?
    
    fileprivate var reposes = [Repos]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
        tableView.separatorStyle = .none
        tableView.register(RepoCell.nib, forCellReuseIdentifier: RepoCell.reuseIdentifier)
        
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchResultsUpdater = self
        searchController?.searchBar.showsCancelButton = true
        searchController?.searchBar.sizeToFit()
        searchController?.searchBar.delegate = self
        searchController?.searchBar.becomeFirstResponder()
        searchController?.hidesNavigationBarDuringPresentation = false
        if #available(iOS 9.1, *) {
            searchController?.obscuresBackgroundDuringPresentation = false
        }
        navigationItem.titleView = searchController?.searchBar
        
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
    
    // MARK: - UISearchResultsUpdating

    func updateSearchResults(for searchController: UISearchController) {
        searchController.searchBar .setShowsCancelButton(true, animated: false)
        
//        guard let keyword = searchController.searchBar.text, !keyword.isEmpty else {
//            return
//        }
//        print(searchController.searchBar.text ?? "")
//        search(for: keyword) { 
//            
//        }
        
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: false, completion: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let keyword = searchBar.text, !keyword.isEmpty else {
            return
        }
       
        search(for: keyword)
    }
    
    // MARK: - Private Methods
    
    private func search(for keyword: String, handler: (() -> Void)? = nil) {
        let url = "\(HOST)/search/repositories?q=\(keyword)"
        Alamofire.request(url).responseJSON { response in
            
            guard let json = response.result.value as? [String: Any], let results = json["items"] else {
                return
            }
            
            debugPrint(results)
            
            self.reposes = (results => Repos.self)!
        }
    }

}
