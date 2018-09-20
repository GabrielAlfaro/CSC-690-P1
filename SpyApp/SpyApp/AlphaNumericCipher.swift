
import Foundation




struct AlphaNumericCipher : Cipher {
    
    
    //Assume that the amount of letters inputted are short enough to not crash the app
    //could change the casting for the shiftedCharacter to a 32 bit unsigned character
    //but that would require using an optional
    
    
    
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        
//        let invalidChar = "!\"#$%&'()*+,-./:;<=>?@[]{}~`"
        
        let newText = plaintext.uppercased()
        //change the string to uppercase
        
//        let alphaNumericDictionary = [48: "0",49: "1", 50: "2", 51: "3", 52: "4", 53: "5",
//         54: "6", 55: "7", 56: "8", 57: "9", 65: "A" , 66: "B" , 67: "C", 68: "D", 69: "E",
//         70: "F", 71: "G", 72: "H", 73: "I", 74: "J", 75: "K", 76: "L", 77: "M", 78: "N",
//         79: "O", 80: "P", 81: "Q", 82: "R", 83: "S", 84: "T", 85: "U", 86: "V", 87: "W",
//         88: "X", 89: "Y", 90: "Z"]
        
        
        for char in newText {
            
            if (65...90).contains(char.unicodeScalars.first!.value){
                
              //  UInt32(String(char)) != nil //redundant
            } else if (48...57).contains(char.unicodeScalars.first!.value){
                //do nothing, range takes into account the integers
            }else {
                return nil
            }
            
        }
        
        var encoded = ""
        
        for character in newText {
            
        let unicode = character.unicodeScalars.first!.value
            
            if unicode % 2 == 0{
                //remaind = 0
            } else {
                //remainder = 1
            }
        var shiftedUnicode = unicode + shiftBy//needs to be mutated, changed from let identifier
            //add the secret to the unicode of the first character
            
            
            if shiftedUnicode > 57 && shiftedUnicode < 64 {//changed 65 to 64
                let numRemainder = shiftedUnicode - 57//remainder
                shiftedUnicode = 64
                let newShiftedUnicode = shiftedUnicode + numRemainder
                
                let shiftedChracter = String(UnicodeScalar(UInt8(newShiftedUnicode)))
                encoded = encoded + shiftedChracter
                
            } else //else to check both conditions, check to see if else identifier is not needed
            if shiftedUnicode > 90 {
                //covers letters
                let remainder = shiftedUnicode - 90//remainder
                shiftedUnicode = 47//set the character to 0 to set it in
                let newShiftedUnicode = shiftedUnicode + remainder
                let shiftedCharacter = String(UnicodeScalar(UInt8(newShiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }else {
                //already have let unicode = character.unicodeScalars.first!.value
                //already have let shiftedUnicode = unicode + shiftBy
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
                
            }
        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var decoded = ""
        
        let newText = plaintext.uppercased()
        
        for character in newText {
            //try switching all operators from + to - for decoding
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode - shiftBy//needs to be mutated, changed from let identifier
            //subtract the secret from the unicode of the character value
            
            if shiftedUnicode < 57 || shiftedUnicode > 64 {//changed 65 to 64
                //comparison operators switched
                // < && > output for decoding 12de = ,-?@
                //when using wx89 as an example
                
                let numRemainder = shiftedUnicode + 90//remainder
                //trying changing 57 to 90
                
                //switched - to +
                shiftedUnicode = 67
                //change 64 to 67
                
                //try remainder subtract shiftedUnicode, originally shiftedUnicode + remainder
                let newShiftedUnicode = numRemainder - shiftedUnicode
                let shiftedChracter = String(UnicodeScalar(UInt8(newShiftedUnicode)))
                decoded = decoded + shiftedChracter
            } else //else to check both conditions, check to see if else identifier is not needed
                if shiftedUnicode > 90 {
                    //ccomparison operators switched
                    //covers letters
                    let remainder = shiftedUnicode + 90//remainder
                    //switched - to +
                    shiftedUnicode = 47//set the character to 0 to set it in
                    //try to make remainder subtract shiftedUnicode, originally shiftedUnicode + remainder
                    let newShiftedUnicode = remainder - shiftedUnicode
                    
                    let shiftedCharacter = String(UnicodeScalar(UInt8(newShiftedUnicode)))
                    decoded = decoded + shiftedCharacter
                }else {
                    //already have let unicode = character.unicodeScalars.first!.value
                    //already have let shiftedUnicode = unicode + shiftBy
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    decoded = decoded + shiftedCharacter
            }
        }
        
        
        
        
        
        
        
        return decoded
    }
    
    
    
    
    
    
    
    
    
    
    
}
