//
//  CommonFunctions.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 15.05.2021.
//

import Firebase
import Foundation
import UIKit

class CommonFunctions {
    func setupImage(with urlString: String?, for imageView: UIImageView, defaultImage: UIImage) {
        var image: UIImage? = nil
        if let urlString = urlString, !urlString.isEmpty {
            let ref = Storage.storage().reference(forURL: urlString)
            let megaByte = Int64(15 * 1024 * 1024)
            ref.getData(maxSize: megaByte) { (data, error) in
                guard let imageData = data else {
                    return
                }
                image = UIImage(data: imageData)
                imageView.image = image
                return
            }
        }
        imageView.image = defaultImage
    }
    
    func dateFromString(dateString: String?) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/mm/yyyy"
        if let date = dateString {
            return formatter.date(from: date)
        }
        return nil
    }
    
    func clearUserDefaults() {
        let defaults = UserDefaults.standard
        defaults.set("", forKey: DefaultsKeys.userUid)
    }
}
