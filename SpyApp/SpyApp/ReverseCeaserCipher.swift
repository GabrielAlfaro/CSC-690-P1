//
//  LetterToNumCipher.swift
//  SpyApp
//
//  Created by SCMACEXT-19 on 9/14/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation
//letter to number
//returns the ascii table value shifte over
//and decoding will shift the ascii value back and cast it back to a string

struct ReverseCeaserCipher: Cipher {

    
    
    func encode(_ plaintext: String, secret: String) -> String? {
        
        guard let shiftBy = UInt32(secret) else{
            return nil
        }
        
        
        var encoded = ""
        
        if plaintext.contains("\""){
             encoded = "Quotation marks are not a valid character!"
            return encoded
            // return nil
        }else{
        //append the number to the string with a space to seperate each letter
        //or just have all the numbers there/have to check if numbers will be converted
        //correctly
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            
            if shiftedUnicode < 33 || shiftedUnicode > 123 {
                return nil
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
            
            //revere the string
            
        }
        let reversed = String(encoded.reversed())
        
        //originally return encoded
        return reversed
        }//for else statement
    }
    

    func decode(_ plaintext: String, secret: String) -> String? {
        
        guard let shiftBy = UInt32(secret) else{
            return nil
        }
        
        
        var decoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftBy
            let shiftedCharacters = String(UnicodeScalar(UInt8(shiftedUnicode)))
            
            decoded = decoded + shiftedCharacters
        }
        let reversedBack = String(decoded.reversed())
        
        //originally return decoded
        return reversedBack
    }
    
}
