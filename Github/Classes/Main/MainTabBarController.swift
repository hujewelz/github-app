//
//  MainTabBarController.swift
//  Github
//
//  Created by jewelz on 2017/3/23.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVc = HomeViewController()
        let profileVc = ProfileViewController()
        addChildViewController(homeVc, title: "首页", normalImageNamed: nil, selectedImageNamed: nil)
        addChildViewController(profileVc, title: "我的", normalImageNamed: nil, selectedImageNamed: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func addChildViewController(_ childController: UIViewController, title: String, normalImageNamed imageNamed: String? = nil, selectedImageNamed sImageNamed: String? = nil) {
        childController.title = title
        
        if let imageNamed = imageNamed, let sImageNamed = sImageNamed {
            childController.tabBarItem.image = UIImage(named: imageNamed)
            childController.tabBarItem.selectedImage = UIImage(named: sImageNamed)?.withRenderingMode(.alwaysOriginal)
        }
        
        childController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.black], for: .normal)
        childController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .selected)
        
        addChildViewController(MainNavigationController(rootViewController: childController))
    }
    

}
