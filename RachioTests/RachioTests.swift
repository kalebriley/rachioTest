//
//  RachioTests.swift
//  RachioTests
//
//  Created by kaleb riley on 8/28/17.
//  Copyright © 2017 Kaleb Riley. All rights reserved.
//

import XCTest
@testable import Rachio

class RachioTests: XCTestCase {
    
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
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testNetworkingCall() {
        let thisExpectation = expectation(description: "Example")
        
        enum Object: TargetType {
            case test
            
            var route: String {
                switch self {
                case .test:
                    return "/public/person/info"
                }
            }
        }
        
        let network = NetworkClient.shared
        network.request(target: Object.test) {result in
            switch result {
            case .success(let response):
                print(response)
                thisExpectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    
    func testUserInfo() {
        let thisExpectation = expectation(description: "Example")
        
        enum Object: TargetType {
            case test
            
            var route: String {
                switch self {
                case .test:
                    return "/public/person/info"
                }
            }
        }
        
        let network = NetworkClient.shared
        network.request(target: Object.test) {result in
            switch result {
            case .success(let response):
                print(response)
                thisExpectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
