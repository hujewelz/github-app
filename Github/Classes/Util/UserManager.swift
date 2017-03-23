//
//  UserManager.swift
//  Github
//
//  Created by jewelz on 2017/3/23.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import Foundation


final class UserManager {
    
    static let shared = UserManager()
    
    var token: String? {
        get {
            return access_token ?? UserDefaults.standard.value(forKey: TOKEN_KEY) as? String
        }
    }
    
    private var access_token: String?
    
    var user: User?
    
    
    func save(_ token: String) {
        access_token = token
        
        UserDefaults.standard.set(token, forKey: TOKEN_KEY)
        UserDefaults.standard.synchronize()
    }
    
    func save(_ user: User) {
        self.user = user
        
        // save to disk
    }
    
    
    
    
}
