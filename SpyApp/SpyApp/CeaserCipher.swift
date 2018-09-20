import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    
    func decode(_ plaintext: String, secret: String) -> String?
}

struct CeaserCipher: Cipher {
    
    //shifts the character by the integer picked by the user
    //assuming the user won't shift the characters by more than 4 when using z
    //assuming the user won't shift the characters negatively more than 8 from the integer 0

    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""

        
        for character in plaintext {
            
            
            if (40...125).contains(character.unicodeScalars.first!.value){
                //do nothing
                //this keeps the range of available characters
                //from 0 to Z with symbols inside
                //gives extra wiggle room for shifting, need to test case if
                //the secret pushes the the ascii value to far off
            }else{
                return nil
            }
            //might take a while to process since it goes character by character
            
            
            let unicode = character.unicodeScalars.first!.value
 
            let shiftedUnicode = unicode + shiftBy
            //seems to handle crashes
            //keeps passing through ! as a valid input though
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        
        guard let shiftedBy = UInt32(secret) else{
            return nil
        }
        
        
        var decoded = ""
        
        if plaintext.contains("\""){
            return nil
        } else if plaintext.contains("?"){
            return nil
        }
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftedBy
            
            if shiftedUnicode <= 33 {
                decoded = decoded + "!"
            }//without it will crash, can encode ! to " but cant decode " to !
            else if shiftedUnicode > 122{
                return nil
            }
            
            let shiftedCharacters = String(UnicodeScalar(UInt8(shiftedUnicode)))
            
            decoded = decoded + shiftedCharacters
        }
        
        return decoded
    }
}
