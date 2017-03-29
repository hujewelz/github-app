//
//  ContentViewController.swift
//  Github
//
//  Created by jewelz on 2017/3/29.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit
import Alamofire
import ModelSwift

class ContentViewController: UIViewController {
    
    lazy var contentTextView: UITextView = {
        let textView = UITextView(frame: SCREEN_RECT)
        textView.font = UIFont.systemFont(ofSize: 11)
        
        return textView
    }()
    
    
    private var content: String = "" {
        didSet {
            if let base64Data = Data(base64Encoded: content) {
                contentTextView.text =  String(data: base64Data, encoding: .utf8)
            }
        }
    }
    
    var url: String = "" {
        didSet {
            fetchData(With: url)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(contentTextView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func fetchData(With url: String) {
        Alamofire.request(url).responseJSON { response in
            guard let json = response.result.value else {
                return
            }
            debugPrint(json)
            let contentObj = (json ~> Content.self)!
            self.content = contentObj.content
            
        }
    }

}
