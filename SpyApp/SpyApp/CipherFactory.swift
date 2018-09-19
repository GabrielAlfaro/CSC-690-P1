import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "AlphaNum": AlphaNumericCipher(),
        "ReverseCeaser": ReverseCeaserCipher(),
        "RandomChar": RandomCharacters()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
