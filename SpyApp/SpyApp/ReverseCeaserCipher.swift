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
//assuming the user won't shift the characters by more than 4 when using z
//assuming the user won't shift the characters negatively more than 8 from the integer 0

struct ReverseCeaserCipher: Cipher {

    
    
    func encode(_ plaintext: String, secret: String) -> String? {
        
        guard let shiftBy = UInt32(secret) else{
            return nil
        }
        
        for char in plaintext {
            if(40...125).contains(char.unicodeScalars.first!.value){
                //do nothing you good
            }else {
                return nil
            }
        }
        
        var encoded = ""
        
        for character in plaintext {

            
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
            
            //revere the string
            
        }
        let reversed = String(encoded.reversed())
        
        //originally return encoded
        return reversed
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
