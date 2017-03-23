//
//  Repos.swift
//  Github
//
//  Created by jewelz on 2017/3/23.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit

class Repos: NSObject {
    var id = 0
    var name = ""
    var owner: User?
    var desc = ""
    
    override var reflectedProperty: [String: String] {
        return ["desc": "description"]
    }
    
    override var reflectedObject: [String : AnyClass] {
        return ["owner": User.self]
    }
}
