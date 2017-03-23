//
//  LoginViewController.swift
//  Github
//
//  Created by jewelz on 2017/3/19.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

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
    
}

extension LoginViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("did load: \(webView.request)")
        
        let js = "document.getElementsByTagName('pre')[0].innerHTML"
        
        guard let result = webView.stringByEvaluatingJavaScript(from: js) else {
            return
        }
        guard let token = result.components(separatedBy: "&").first?.components(separatedBy: "=").last else {
            return
        }
        
        print("token: \(token)")
        if token.isEmpty {
            webView.reload()
            return
        }
        
        webView.isHidden = true
        
        UserManager.shared.save(token)
        
        Alamofire.request(USER_INFO_URL + token).responseJSON { response in
            
            guard let json = response.result.value else {
                return
            }
            
           // debugPrint(json)
            guard let user: User = json ~> User.self else {
               return
            }
            
            UserManager.shared.save(user)
            let window = (UIApplication.shared.delegate as! AppDelegate).window
            window?.rootViewController = MainTabBarController()
        }
        
    }
}

