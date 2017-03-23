//
//  LoginServer.swift
//  Github
//
//  Created by jewelz on 2017/3/19.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import PromiseKit




//func oauth() -> Promise<Any>{
//    return Promise {fulfill, reject in
//        Alamofire.request(OAUTH_URL).responseJSON { response in
//            switch response.result {
//            case .success(let json):
//                fulfill(json)
//            case .failure(let err):
//                reject(err)
//                
//            }
//        }
//    }
//}
//
//func getToken(code: String) -> Promise<Any> {
//    return Promise {fulfill, reject in
//        Alamofire.request(OAUTH_URL).responseJSON { response in
//            switch response.result {
//            case .success(let json):
//                fulfill(json)
//            case .failure(let err):
//                reject(err)
//                
//            }
//        }
//    }
//}
//
//func login() {
//    firstly {
//        oauth()
//    }.then { result in
//        getToken(code: "")
//    }.then { result in
//        print(result)
//    }.catch { err in
//        print(err)
//    }
//}
//

