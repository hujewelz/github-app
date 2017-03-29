//
//  LoginViewController.swift
//  Github
//
//  Created by jewelz on 2017/3/19.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit
import Alamofire
import ModelSwift

class LoginViewController: UIViewController {

    // MARK: - lift cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let webView = UIWebView(frame: SCREEN_RECT)
        let request = URLRequest(url: URL(string: OAUTH_URL)!)
        webView.delegate = self
        webView.loadRequest(request)
        view.addSubview(webView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func signIn(with token: String) {
        UserManager.shared.save(token)
        
        Alamofire.request(USER_INFO_URL + token).responseJSON { response in
            
            guard let json = response.result.value else {
                return
            }
            
            //debugPrint(json)
            let user = (json ~> User.self)!
            UserManager.shared.save(user)
            
            let window = (UIApplication.shared.delegate as! AppDelegate).window
            window?.rootViewController = MainTabBarController()
        }
    }
    
}

extension LoginViewController: UIWebViewDelegate {
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let url = (request.url?.absoluteString)!
        if !url.hasPrefix("app://token") {
            return true
        }
       
        let token = url.components(separatedBy: "=").last!
        print("token: \(token)")

        signIn(with: token)
        
        return false
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("did load: \(webView.request)")
        
    }
    
}

