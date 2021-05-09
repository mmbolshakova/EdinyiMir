//
//  PersonalViewController.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 23.04.2021.
//

import UIKit
import Firebase

//MARK: - ComeIntView
class PersonalViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var statusBarView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var comeInView: UIView!
    @IBOutlet weak var comeToProfileLabel: UILabel!
    @IBOutlet weak var mooiLabel: UILabel!
    
    //MARK: - ConfirmationView
    @IBOutlet weak var confirmationView: UIView!
    @IBOutlet weak var confirmImageView: UIImageView!
    
    //MARK: - ProfileView
    @IBOutlet weak var profileView: UIView!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var otherNameLabel: UILabel!
    @IBOutlet weak var otherNameField: UITextField!
    @IBOutlet weak var otherName: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    @IBOutlet weak var birthday: UILabel!
    
    @IBOutlet weak var loadProfilePhotoButton: UIButton!
    @IBOutlet weak var profilePhoto: UIImageView!
    
    
    //MARK: - ContactsView
    @IBOutlet weak var contactsView: UIView!
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var phone: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var email: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupColors()
        
        setupConfirmationView()
        setupProfileView()
        setupContactsView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                self.mainView.isHidden = false
            }
        }
    }
    
    private func setupColors() {
        let viewsArray = [comeInView, headerView, statusBarView]
        viewsArray.forEach { view in
            view?.backgroundColor = Colors.secondaryBackgroundColor
        }
        mainView.backgroundColor = Colors.backgroundColor
        comeToProfileLabel.textColor = Colors.labelColor
        mooiLabel.textColor = Colors.labelColor
    }
    
    @IBAction func comeIn(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AuthViewController") as? AuthViewController
        {
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func register(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        {
            present(vc, animated: true, completion: nil)
        }
    }
}

//MARK: - PersonalInfoView
extension PersonalViewController {
    private func setupConfirmationView() {
        confirmationView.backgroundColor = Colors.secondaryBackgroundColor
        confirmImageView.tintColor = .green
    }
    
    private func setupProfileView() {
        profileView.backgroundColor = Colors.secondaryBackgroundColor
        lastNameLabel.textColor = Colors.customGray
        lastNameField.isHidden = true
        
        firstNameLabel.textColor = Colors.customGray
        firstNameField.isHidden = true
        
        otherNameLabel.textColor = Colors.customGray
        otherNameField.isHidden = true
        
        birthdayLabel.textColor = Colors.customGray
//        birthday.isHidden = true
        birthdayDatePicker.isHidden = true
        
        loadProfilePhotoButton.titleLabel?.textAlignment = .center
        loadProfilePhotoButton.isHidden = true
        profilePhoto.center = view.center
    }
    
    private func setupContactsView() {
        contactsView.backgroundColor = Colors.secondaryBackgroundColor
        
        phoneLabel.textColor = Colors.customGray
        phoneField.isHidden = true
        
        emailLabel.textColor = Colors.customGray
        emailField.isHidden = true
    }
}
