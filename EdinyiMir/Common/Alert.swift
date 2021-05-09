//
//  Alert.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 06.05.2021.
//

import Foundation
import UIKit

class Alert: UIViewController {
    func showAlert(fromController controller: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}
