//
//  CryptedData.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 18.05.2021.
//

import Foundation
import CryptoSwift

public enum IV {
    static let IVString = "gh8L2nkHPz"
}

class CryptedData {
    func encrypt(key: String, message: String?) -> String? {
        let password: [UInt8] = Array(key.utf8)
        let salt: [UInt8] = Array(IV.IVString.utf8)

        /* Generate a key from a `password`. Optional if you already have a key */
        guard let key = try? PKCS5.PBKDF2(
            password: password,
            salt: salt,
            iterations: 4096,
            keyLength: 32, /* AES-256 */
            variant: .sha256
        ).calculate() else {
            return nil
        }

        /* Generate random IV value. IV is public value. Either need to generate, or get it from elsewhere */
        let iv = AES.randomIV(AES.blockSize)

        /* AES cryptor instance */
        guard let aes = try? AES(key: key, blockMode: CBC(iv: iv), padding: .pkcs7) else {
            return nil
        }

        /* Encrypt Data */
        let inputData = Data(message!.utf8)
        guard let encryptedBytes = try? aes.encrypt(inputData.bytes) else {
            return nil
        }
        let encryptedData = Data(encryptedBytes)
        return String(decoding: encryptedData, as: UTF8.self)
        /* Decrypt Data */
        guard let decryptedBytes = try? aes.decrypt(encryptedData.bytes) else {
            return nil
        }
        let decryptedData = Data(decryptedBytes)
    }
    
    func decrypt(key: String, message: String?) -> String? {
        let password: [UInt8] = Array(key.utf8)
        let salt: [UInt8] = Array(IV.IVString.utf8)

        /* Generate a key from a `password`. Optional if you already have a key */
        guard let key = try? PKCS5.PBKDF2(
            password: password,
            salt: salt,
            iterations: 4096,
            keyLength: 32, /* AES-256 */
            variant: .sha256
        ).calculate() else {
            return nil
        }

        /* Generate random IV value. IV is public value. Either need to generate, or get it from elsewhere */
        let iv = AES.randomIV(AES.blockSize)

        /* AES cryptor instance */
        guard let aes = try? AES(key: key, blockMode: CBC(iv: iv), padding: .pkcs7) else {
            return nil
        }

        /* Encrypt Data */
        let inputData = Data(message!.utf8)
//        guard let encryptedBytes = try? aes.encrypt(inputData.bytes) else {
//            return nil
//        }
//        let encryptedData = Data(encryptedBytes)
//        return String(decoding: encryptedData, as: UTF8.self)
        /* Decrypt Data */
        guard let decryptedBytes = try? aes.decrypt(inputData.bytes) else {
            return nil
        }
        let decryptedData = Data(decryptedBytes)
        return String(decoding: decryptedData, as: UTF8.self)
    }
}
