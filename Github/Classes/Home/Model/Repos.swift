//
//  Repos.swift
//  Github
//
//  Created by jewelz on 2017/3/23.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit
import ModelSwift

class Repos: NSObject {
    var id = 0
    var name = ""
    var owner: User?
    var desc = ""
    var url = ""
    var contents_url = ""
    var language = ""
    var forks_count = 0
    var stargazers_count = 0
    
    var starts: String {
        return stargazers_count < 1000
            ? String(stargazers_count)
            : "\(stargazers_count / 1000)k"
    }
    
    var forks: String {
        return forks_count < 1000
            ? String(forks_count)
            : "\(forks_count / 1000)k"
    }
    
    private enum LanguageColor: String {
        case oc, Swift, C, cPlue, JavaScript, CSS, HTML, PHP, Ruby
        
        var color: UIColor {
            switch self {
            case .Swift:
                return UIColor(red: 1, green: 172/255, blue: 73/255, alpha: 1)
            case .C:
                return UIColor(red: 1, green: 172/255, blue: 73/255, alpha: 1)
            case .cPlue:
                return UIColor(red: 243/255, green: 75/255, blue: 124/255, alpha: 1)
            case .HTML:
                return UIColor(red: 227/255, green: 76/255, blue: 38/255, alpha: 1)
            case .JavaScript:
                return UIColor(red: 242/25, green: 224/255, blue: 89/255, alpha: 1)
            case .CSS:
                return UIColor(red: 1, green: 172/255, blue: 73/255, alpha: 1)
            case .PHP:
                return UIColor(red: 1, green: 172/255, blue: 73/255, alpha: 1)
            case .Ruby:
                return UIColor(red: 0, green: 172/255, blue: 93/255, alpha: 1)
            default:
                return UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
            }
        }
    }
    
    var color: UIColor {
        return LanguageColor(rawValue: language)?.color
            ?? UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
    }
    
}

extension Repos: Replacable, Reflectable {
    var replacedProperty: [String : String] {
        return ["desc": "description"]
    }
    
    var reflectedObject: [String : Any.Type] {
        return ["owner": User.self]
    }
}
