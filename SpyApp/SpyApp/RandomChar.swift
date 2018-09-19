

import Foundation



struct RandomCharacters: Cipher {
    
    //need to finish this cipher
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        if plaintext.contains("\""){
            return nil
        }
        
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
        
            if shiftedUnicode < 33 || shiftedUnicode > 123 {
                return nil
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter + "+"
        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        
        guard let shiftedBy = UInt32(secret) else{
            return nil
        }
        
        let newString = plaintext.replacingOccurrences(of: "+", with: "")

        var decoded = ""
        for character in newString {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftedBy
            
//            if shiftedUnicode < 33 || shiftedUnicode > 123 {
//                return nil
//            }
            
            let shiftedCharacters = String(UnicodeScalar(UInt8(shiftedUnicode)))
            //thread 1 fatal error, not enough bits to represent a signed value
            //try changing the UInt from 8 bit to 32 bit unsigned character: Successful
            
            decoded = decoded + shiftedCharacters
        }
        
        return decoded
    }
    
}
