//
//  RandomCharTests.swift
//  SpyAppTests
//
//  Created by SCMACEXT-19 on 9/17/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp


class RandomCharTests: XCTestCase {
    
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()

        cipher = RandomCharacters()
    }
    
    
    func test_TryingOutEncodingInputValue(){
        
        let cipher = RandomCharacters()
        
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "1")
        
        XCTAssertEqual("b+", result)
        
    }
    
    func test_TheLengthOfCastingAndRepresentingASignedValue(){
     
        let cipher = RandomCharacters()
        
        let plaintext = "j+g+n+n+q+v+j+g+t+g+"
        
        let result = cipher.decode(plaintext, secret: "2")
        
        XCTAssertEqual("hellothere", result)
        //test result succeeded but running in app causes crash
        //
        
    }
    
    
    func test_TryingQuotationsAsPartOfInput(){
        
        let cipher = RandomCharacters()
        
        let plaintext = "2"
        
        
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
