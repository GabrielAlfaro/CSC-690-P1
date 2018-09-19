//
//  AlpaNumericCipherTests.swift
//  SpyAppTests
//
//  Created by SCMACEXT-19 on 9/17/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class AlpaNumericCipherTests: XCTestCase {
    
    
    var cipher: Cipher!
    
    override func setUp() {//called first
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        cipher = AlphaNumericCipher()
        
    }
    
    func test_oneCharacterStringGetsMappedToSelfWith_0_secret(){
        
        let cipher = AlphaNumericCipher()
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual("A", result)
    }
    
    func test_nonNumericInputForSecret(){
        let cipher = AlphaNumericCipher()
        
        let result = cipher.encode("b", secret: "nonNumericString")
        //returns null
        
    }
    
    func test_CorrectEncodingOfNumberAndLetterEdgeMapping(){
        
        let cipher = AlphaNumericCipher()
        let plaintext = "wx89"
        
        let result = cipher.encode(plaintext, secret: "5")
        
        XCTAssertEqual("12DE", result)
    }
    
    func test_CorrectDecodingOfNumberAndLetterEdgeMapping(){
        let cipher = AlphaNumericCipher()
        let plaintext = "rniiqj"
        
        let result = cipher.decode(plaintext, secret: "5")
        
        XCTAssertEqual("middle", result)
   //Failed test
    }
    
    
    func test_DecodeForLettersandNumbersOnTheEdgeOfRangesForLooping(){
        let cipher = AlphaNumericCipher()
        
        
        //input to decode = 23
        let plaintext = "AB"
        
        let result = cipher.decode(plaintext, secret: "8")
        
        
        XCTAssertEqual(result , "23")
        
        //why does the test succeed when the result and string "23" are flipped?
        
    }
    
    
    
    
    override func tearDown() {//
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
