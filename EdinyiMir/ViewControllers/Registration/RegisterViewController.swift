//
//  RegisterViewController.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 26.04.2021.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    //MARK: - Private Variables
    private let regions = [" ", "Крымское РО", "г. Москва", "Петербургское РО", "Челябинское РО", "Чеченское РО"]
    private var idRegion: Int = 0
    private var selectedRegion: String?
    private let alert = Alert()
    
    //MARK: - ProfileView
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var loadProfilePhotoButton: UIButton!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //MARK: - ContactsView
    @IBOutlet weak var contactsView: UIView!
    
    //MARK: - PassportView
    @IBOutlet weak var passportView: UIView!
    @IBOutlet weak var whenIssuedDatePicker: UIDatePicker!
    @IBOutlet weak var loadfirstPageButton: UIButton!
    @IBOutlet weak var loadregistrationPageButton: UIButton!
    
    //MARK: - VTEKview
    @IBOutlet weak var vtekView: UIView!
    @IBOutlet weak var loadfirstVtekButton: UIButton!
    @IBOutlet weak var loadSecondVtekButton: UIButton!
    
    //MARK: - RegionView
    @IBOutlet weak var regionView: UIView!
    @IBOutlet weak var regionPickerView: UIPickerView!
    
    //MARK: - AgreementsView
    @IBOutlet weak var agreementsView: UIView!
    
    //MARK: - PasswordView
    @IBOutlet weak var passwordView: UIView!
    
    
    //MARK: - FieldsForRegistration
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var otherNameField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var seriaField: UITextField!
    @IBOutlet weak var passportNumberField: UITextField!
    @IBOutlet weak var issuedByField: UITextField!
    @IBOutlet weak var codeField: UITextField!
    
    @IBOutlet weak var vtekSeriaField: UITextField!
    @IBOutlet weak var vtekNumberField: UITextField!
    @IBOutlet weak var dateVtek: UITextField!
    
    @IBOutlet weak var agreementSwitch: UISwitch!
    @IBOutlet weak var authenticitySwitch: UISwitch!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var applyPasswordField: UITextField!
    
    //MARK: - RegistrationButton
    @IBOutlet weak var registrationButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.backgroundColor = Colors.modalBackgroundColor
        setupPersonalInfoView()
        setupContactsView()
        setupPassportInfoView()
        setupVtekView()
        setupRegionView()
        setupAgreementsView()
        setupPasswordView()
        
        regionPickerView.delegate = self
        regionPickerView.dataSource = self
        
        registrationButton.addTarget(self, action: #selector(register), for: .touchUpInside)
    
    }

    private func setupPersonalInfoView() {
        scrollView.backgroundColor = Colors.modalBackgroundColor
        profileView.backgroundColor = Colors.modalSecondaryBackgroundColor
        
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.calendar.locale = Locale(identifier: "ru_RU")
        
        loadProfilePhotoButton.titleLabel?.textAlignment = .center
    }
    
    private func setupContactsView() {
        contactsView.backgroundColor = Colors.modalSecondaryBackgroundColor
    }
    
    private func setupPassportInfoView() {
        passportView.backgroundColor = Colors.modalSecondaryBackgroundColor
        
        whenIssuedDatePicker.locale = Locale(identifier: "ru_RU")
        whenIssuedDatePicker.calendar.locale = Locale(identifier: "ru_RU")
        
        loadfirstPageButton.titleLabel?.textAlignment = .center
        loadregistrationPageButton.titleLabel?.textAlignment = .center
    }
    
    private func setupVtekView() {
        vtekView.backgroundColor = Colors.modalSecondaryBackgroundColor
        
        loadfirstVtekButton.titleLabel?.textAlignment = .center
        loadSecondVtekButton.titleLabel?.textAlignment = .center
    }
    
    private func setupRegionView() {
        regionView.backgroundColor = Colors.modalSecondaryBackgroundColor
    }
    
    private func setupAgreementsView() {
        agreementsView.backgroundColor = Colors.modalSecondaryBackgroundColor
    }
    
    private func setupPasswordView() {
        passwordView.backgroundColor = Colors.modalSecondaryBackgroundColor
    }
    
    @IBAction func closeViewController(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension RegisterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return regions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return regions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRegion = regions[row]
        idRegion = row
    }
}

extension RegisterViewController {
    //MARK: - Registration
    @objc private func register() {
        if checkForEmptyFields() && checkForSelectedRegion() &&  checkForPassword() &&  checkForCorrectEmail() {
            let lastName = lastNameField.text!
            let firstName = firstNameField.text!
            let otherName = otherNameField.text
            let birthdayDate = datePicker.date.string()
            let phone = phoneField.text!
            let email = emailField.text!
            let passportSeria = seriaField.text!
            let passportNumber = passportNumberField.text!
            let issuedBy = issuedByField.text!
            let whenIssuedDate = whenIssuedDatePicker.date.string()
            let code = codeField.text!
            let vtekSeria = vtekSeriaField.text!
            let vtekNumber = vtekNumberField.text!
            let vtekDate = dateVtek.text!
            let region = selectedRegion!
            let pass = passwordField.text!
            
            Auth.auth().createUser(withEmail: email, password: pass) { (result, error) in
                if error == nil {
                    if let userID = result?.user.uid {
                        let referenceDatabase = Database.database().reference().child(DatabaseTable.usersDB)
                        referenceDatabase.child(userID).updateChildValues([
                            "lastName" : lastName,
                            "firstName" : firstName,
                            "otherName" : otherName ?? "",
                            "birthday" : birthdayDate,
                            "phone" : phone,
                            "email" : email,
                            "passportSeria" : passportSeria,
                            "passportNumber" : passportNumber,
                            "passportIssuedBy" : issuedBy,
                            "passportWhenIssued" : whenIssuedDate,
                            "passportCode" : code,
                            "vtekSeria" : vtekSeria,
                            "vtekNumber" : vtekNumber,
                            "vtekDate" : vtekDate,
                            "region" : region,
                            "confirmation" : false,
                            "confirmationReason" : "Ожидайте проверки модератора"
                        ])
                    }
                    self.alert.showAlert(fromController: self, title: "Вы успешно зарегистрировались", message: "Ожидайте верификации аккаунта. Информация появится в личном кабинете")
                } else {
                    self.alert.showAlert(fromController: self, title: "", message: "Пользователь с таким E-mail уже существует")
                }
            }
        }
    }
    
    private func checkForEmptyFields() -> Bool {
        let registerFieldsArray = [lastNameField, firstNameField, phoneField, emailField, seriaField, passportNumberField, issuedByField, codeField, vtekSeriaField, vtekNumberField, dateVtek, passwordField, applyPasswordField]
        let switches = [agreementSwitch, authenticitySwitch]
        var isNotEmptyOrUnselected = true
        
        registerFieldsArray.forEach { field in
            if let field = field {
                if field.isEmpty {
                    alert.showAlert(fromController: self, title: "", message: "Необходимо заполнить все обязательные поля")
                    isNotEmptyOrUnselected = false
                }
            }
        }
        switches.forEach { item in
            if let item = item {
                if !item.isOn {
                    alert.showAlert(fromController: self, title: "", message: "Необходимо дать согласие на обработку персональных данных и подтвердить достоверность передачи информации")
                    isNotEmptyOrUnselected = false
                }
            }
        }
        return isNotEmptyOrUnselected
    }
    
    private func checkForSelectedRegion() -> Bool {
        if idRegion == 0 || selectedRegion == nil {
            alert.showAlert(fromController: self, title: "", message: "Необходимо выбрать округ")
        }
        return idRegion != 0 || selectedRegion == nil
    }
    
    private func checkForPassword() -> Bool {
        if let pass = passwordField.text, let applyPass = applyPasswordField.text {
            if pass != applyPass {
                alert.showAlert(fromController: self, title: "", message: "Пароли не совпадают")
                return false
            }
            if pass.count < 6 {
                alert.showAlert(fromController: self, title: "", message: "Пароль должен содержать минимум 6 символов")
                return false
            }
        }
        return true
    }
    
    private func checkForCorrectEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if let email = emailField.text {
            let evalEmailTest = emailTest.evaluate(with: email)
            if !evalEmailTest {
                alert.showAlert(fromController: self, title: "", message: "Необходимо ввести корректный E-mail")
            }
            return evalEmailTest
        }
        return false
    }
}
