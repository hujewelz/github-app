//
//  GithubTests.swift
//  GithubTests
//
//  Created by jewelz on 2017/3/19.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import XCTest
@testable import Github


class GithubTests: XCTestCase {
    
    class A: NSObject {
        var name = "a"
        
        required override init() {
            
        }
    }
    
    let obj: [String: AnyClass] = [
        "a": A.self
    ]
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let ClassA = obj["a"]
        
        let className = NSStringFromClass(ClassA!)
//        
        let classType = NSClassFromString(className)
        
        
        
//        if let type = classType.Type {
//            _ = type.init()
//        }
        
        if let type = ClassA as? NSObject.Type {
            let a = type.init()
            
        }
        
       
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
