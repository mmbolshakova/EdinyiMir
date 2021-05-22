//
//  String.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 18.05.2021.
//

import CryptoSwift
import Foundation
import RNCryptor

extension String {
    func aesEncrypt(key: String) throws -> String? {
        let encrypted = try AES(key: key, iv: IV.IVString, padding: .pkcs7).encrypt([UInt8](self.data(using: .utf8)!))
        return Data(encrypted).base64EncodedString()
    }
    
    func aesDecrypt(key: String) throws -> String? {
        guard let data = Data(base64Encoded: self) else { return "" }
        let decrypted = try AES(key: key, iv: IV.IVString, padding: .pkcs7).decrypt([UInt8](data))
        return String(bytes: decrypted, encoding: .utf8) ?? self
    }
}
