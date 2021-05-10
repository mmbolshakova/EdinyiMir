//
//  Alert.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 06.05.2021.
//

import Foundation
import UIKit

class Alert: UIViewController {
    func showAlert(from controller: UIViewController, title: String, message: String, completion: @escaping () -> Void = { }) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            completion()
        }
        alert.addAction(action)
        controller.present(alert, animated: true, completion: nil)
    }
}
