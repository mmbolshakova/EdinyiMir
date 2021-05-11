//
//  AuthViewController.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 26.04.2021.
//

import UIKit
import Firebase

class AuthViewController: UIViewController {
    @IBOutlet weak var authView: UIView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var comeInButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   
    private let alert = Alert()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupColors()
        
        comeInButton.addTarget(self, action: #selector(didTapComeInButton), for: .touchUpInside)
    }
    
    private func setupColors() {
        let labelsArray = [descriptionLabel, emailLabel, passwordLabel]
        labelsArray.forEach { label in
            label?.textColor = Colors.labelColor
        }
        mainView.backgroundColor = Colors.modalBackgroundColor
        authView.backgroundColor = Colors.modalSecondaryBackgroundColor
    }
    
    @IBAction func closeViewController(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapComeInButton() {
        if let email = emailTextField.text, let pass = passwordTextField.text {
            if !email.isEmpty && !pass.isEmpty {
                Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
                    if error == nil {
                        if let result = result {
                            let defaults = UserDefaults.standard
                            defaults.set(result.user.uid, forKey: DefaultsKeys.userUid)
                        }
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        self.alert.showAlert(from: self, title: "", message: "Логин и/или пароль указан неверно")
                    }
                }
            } else {
                alert.showAlert(from: self, title: "", message: "Заполнены не все поля")
            }
        }
    }
}
