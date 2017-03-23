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

// MARK: - API

let CLIENT_ID = "08511020d69d84fb1df7"
let OAUTH_URL = "https://github.com/login/oauth/authorize?scope=user&client_id=\(CLIENT_ID)"
    + "&redirect_uri=http://localhost:3000/oauth&state=xyz"

/// fetch user information
let USER_INFO_URL = "https://api.github.com/user?access_token="



