//
//  Content.swift
//  Github
//
//  Created by jewelz on 2017/3/27.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit

class Content: NSObject {
    
    enum ContentType: String {
        case dir, file, symlink
    }
    
    var name = ""
    var path = ""
    var size = 0
    var url = ""
    var git_url = ""
    var content = "" //base64
    var type = "" {
        didSet {
            contentsType = ContentType(rawValue: type) ?? .file
        }
    } // dir file
    
    var contentsType = ContentType.dir
}
