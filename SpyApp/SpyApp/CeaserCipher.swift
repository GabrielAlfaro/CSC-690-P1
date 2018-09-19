import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    
    func decode(_ plaintext: String, secret: String) -> String?
}

struct CeaserCipher: Cipher {

    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""

//        let invalidChar = "!\"#$%&'()*+,-./:;<=>?@[]{}~`"
//        if plaintext.contains(invalidChar){
//           encoded = "Error Invalid Character"
//            return encoded
//        }
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
 
            let shiftedUnicode = unicode + shiftBy
            if shiftedUnicode <= 33 || shiftedUnicode > 123 {
                return nil
            }
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
