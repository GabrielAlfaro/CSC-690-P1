import XCTest
@testable import SpyApp

class CeaserCipherTests: XCTestCase {

    var cipher: Cipher!

    override func setUp() {
        super.setUp()
        cipher = CeaserCipher()
    }

    func test_oneCharacterStirngGetsMappedToSelfWith_0_secret() {
        let plaintext = "a"

        let result = cipher.encode(plaintext, secret: "0")

        XCTAssertEqual(plaintext, result)
    }

    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")

        XCTAssertNil(result)
    }

    
    func test_CheckToSeeIfEncodingWorks(){
        let plaintext = "test"
        let result = cipher.encode(plaintext, secret: "5")
        XCTAssertEqual("yjxy", result)
    }
    

    func test_CheckToSeeIfDecodingWorks(){
        let plaintext = "yjxy"
        let result = cipher.decode(plaintext, secret: "5")
        XCTAssertEqual("test", result)
    }
    
    func test_CheckingEncodingForSymbols(){
        let plaintext = "!"
        
        let result = cipher.encode(plaintext, secret: "1")
        
        XCTAssertEqual(nil, result)
        //passes when it shouldnt even allow for exclamation point to pass 
    }
    
    
    
    func test_CheckingDecodingForSymbols(){
        let plaintext = "\""
        print(plaintext)
        let result = cipher.decode(plaintext, secret: "1")
        
        XCTAssertEqual(nil, result)
        //it sees " as a nil
        //when decoding
        
    }
    
    

}
