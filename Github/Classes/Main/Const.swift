//
//  Const.swift
//  Github
//
//  Created by jewelz on 2017/3/19.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit

let SCREEN_RECT = UIScreen.main.bounds
let SCREEN_WIDTH = SCREEN_RECT.width
let SCREEN_HEIGHT = SCREEN_RECT.height

let TOKEN_KEY = "access_toke"

let BLACK_COLOR = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
let BLACK_TEXT_COLOR = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
let BLACK_DESC_TEXT_COLOR = UIColor(red: 87/255, green: 96/255, blue: 105/255, alpha: 1)

// MARK: - API
let HOST = "https://api.github.com"
let CLIENT_ID = "08511020d69d84fb1df7"
let OAUTH_URL =  "http://localhost:3000/login"//"https://github.com/login/oauth/authorize?scope=user&client_id=\(CLIENT_ID)"
    //+ "&redirect_uri=http://localhost:3000/oauth&state=xyz"

/// fetch user information
let USER_INFO_URL = "https://api.github.com/user?access_token="


