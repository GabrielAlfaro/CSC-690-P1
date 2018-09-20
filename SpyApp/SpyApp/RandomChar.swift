

import Foundation



struct RandomCharacters: Cipher {
    
    //assuming the user won't shift the characters by more than 4 when using z
    //assuming the user won't shift the characters negatively more than 8 from the integer 0
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        for char in plaintext {
            if (40...125).contains(char.unicodeScalars.first!.value){
                //valid character
            }else{
             return nil
            }
        }
        
        for character in plaintext {
            
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            
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
