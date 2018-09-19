import UIKit

class SpyAppViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!

    let factory = CipherFactory()
    var cipher: Cipher?

    var plaintext: String {
        if let text = input.text {
            return text
        } else {
            return ""
        }
    }

    var secretText: String {
        if let text = secret.text {
            return text
        } else {
            return ""
        }
    }

    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        let invalidChar = "!\"#$%&'()*+,-./:;<=>?@[]{}~`"
        if plaintext.contains(invalidChar){
            output.text = "Error Invalid Character"
        }
        
        
        if let encoded = cipher.encode(plaintext, secret: secretText) {
            output.text = encoded
        } else {
            output.text = "Error encoding"
        }
        
        
    }
    
    
    @IBAction func decodeButtonPressed(_ sender: UIButton) {
        let plaintext = input.text!
        let secret = self.secret.text!
        
        
        if let cipher = self.cipher {
            output.text = cipher.decode(plaintext, secret: secretText)
        }else {
            output.text = "Error Encoding"
        }
    }
    
    
    

    @IBAction func cipherButtonPressed(_ sender: UIButton) {
        //controlls every input and calls the correct cipher according to the text of the button
        guard
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
        else {
            output.text = "No button or no button text"
            return
        }
        
        
        cipher = factory.cipher(for: buttonText)
    }
}

