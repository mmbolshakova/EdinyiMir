//
//  AuthViewController.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 26.04.2021.
//

import UIKit

class AuthViewController: UIViewController {
    @IBOutlet weak var authView: UIView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var comeInButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupColors()
    }
    
    private func setupColors() {
        let labelsArray = [descriptionLabel, emailLabel, passwordLabel]
        labelsArray.forEach { label in
            label?.textColor = Colors.labelColor
        }
        mainView.backgroundColor = Colors.backgroundColor
        authView.backgroundColor = Colors.secondaryBackgroundColor
    }
    
    @IBAction func closeViewController(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
