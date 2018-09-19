//
//  ReverseCeaserCipherTest.swift
//  SpyAppTests
//
//  Created by SCMACEXT-19 on 9/18/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class ReverseCeaserCipherTest: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = ReverseCeaserCipher()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    
    
    func test_BasicCheckToSeeIfEncodingWorks(){
        let plaintext = "test"
        
        let result = cipher.encode(plaintext, secret: "2")
        
        XCTAssertEqual("vugv", result)
        
        
    }
    
    func test_BasicCheckToSeeIfDecodingWorks(){
        let plaintext = "vugv"
        
        let result = cipher.decode(plaintext, secret: "2")
        
        XCTAssertEqual("test", result)
        
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
    
}
