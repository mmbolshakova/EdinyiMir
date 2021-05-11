//
//  RegisterViewController.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 26.04.2021.
//

import UIKit
import Firebase

private struct LoadButton {
    static let loadProfileButton = "1"
    static let loadPassportFirstPage = "2"
    static let loadPassportSecondPage = "3"
    static let loadVtekFirstPage = "4"
    static let loadVtekSecondPage = "5"
}

class RegisterViewController: UIViewController {
    //MARK: - Private Variables
//    private var regions: [String]? = nil
    private let regions = ["Крымское РО", "г. Москва", "Петербургское РО", "Челябинское РО", "Чеченское РО"]
    private var idRegion: Int = 0
    private var selectedRegion: String?
    private let alert = Alert()
    private var passportFirstTempImage: UIImage? = nil
    private var passportSecondTempImage: UIImage? = nil
    private var vtekFirstTempImage: UIImage? = nil
    private var vtekSecondTempImage: UIImage? = nil
    private var loadButtonsArray: [UIButton]? = nil
    //MARK: - ProfileView
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var loadProfilePhotoButton: UIButton!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var profilePhotoImage: UIImageView!
    
    //MARK: - ContactsView
    @IBOutlet weak var contactsView: UIView!
    
    //MARK: - PassportView
    @IBOutlet weak var passportView: UIView!
    @IBOutlet weak var whenIssuedDatePicker: UIDatePicker!
    @IBOutlet weak var loadfirstPageButton: UIButton!
    @IBOutlet weak var loadregistrationPageButton: UIButton!
    @IBOutlet weak var passportFirstImage: UIImageView!
    @IBOutlet weak var passportSecondImage: UIImageView!
    
    //MARK: - VTEKview
    @IBOutlet weak var vtekView: UIView!
    @IBOutlet weak var loadfirstVtekButton: UIButton!
    @IBOutlet weak var loadSecondVtekButton: UIButton!
    @IBOutlet weak var vtekFirstImage: UIImageView!
    @IBOutlet weak var vtekSecondImage: UIImageView!
    
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
        
        loadProfilePhotoButton.addTarget(self, action: #selector(loadProfilePhotoPressed), for: .touchUpInside)
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
        
        loadfirstPageButton.addTarget(self, action: #selector(loadPassportFirstPhotoPressed), for: .touchUpInside)
        loadregistrationPageButton.addTarget(self, action: #selector(loadPassportSecondPhotoPressed), for: .touchUpInside)
    }
    
    private func setupVtekView() {
        vtekView.backgroundColor = Colors.modalSecondaryBackgroundColor
        
        loadfirstVtekButton.titleLabel?.textAlignment = .center
        loadSecondVtekButton.titleLabel?.textAlignment = .center
        
        loadfirstVtekButton.addTarget(self, action: #selector(loadVtekFirstPhotoPressed), for: .touchUpInside)
        loadSecondVtekButton.addTarget(self, action: #selector(loadVtekSecondPhotoPressed), for: .touchUpInside)
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
        idRegion = row
        selectedRegion = regions[row]
    }
}

extension RegisterViewController {
    //MARK: - Registration
    @objc private func register() {
        if checkForEmptyFields() &&  checkForPassword() &&  checkForCorrectEmail() {
            let lastName = lastNameField.text!
            let firstName = firstNameField.text!
            let otherName = otherNameField.text
            let birthdayDate = datePicker.date.string(withFormat: "dd/mm/yyyy")
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
            let region = selectedRegion
            let pass = passwordField.text!
            var confirmationMessage = "Ожидайте проверки модератора"
            
            Auth.auth().createUser(withEmail: email, password: pass) { (result, error) in
                if error == nil {
                    if let userID = result?.user.uid {
                        let referenceDatabase = Database.database().reference().child(DatabaseTable.usersDB)
                        referenceDatabase.child(userID).updateChildValues([
                            UserRegistration.lastName : lastName,
                            UserRegistration.firstName : firstName,
                            UserRegistration.otherName : otherName ?? "",
                            UserRegistration.birthday : birthdayDate,
                            UserRegistration.phone : phone,
                            UserRegistration.email : email,
                            UserRegistration.passportSeria : passportSeria,
                            UserRegistration.passportNumber : passportNumber,
                            UserRegistration.passportIssuedBy : issuedBy,
                            UserRegistration.passportWhenIssued : whenIssuedDate,
                            UserRegistration.profilePhotoUrl : "",
                            UserRegistration.passportCode : code,
                            UserRegistration.passportFirstPageUrl : "",
                            UserRegistration.passportSecondPageUrl : "",
                            UserRegistration.vtekSeria : vtekSeria,
                            UserRegistration.vtekNumber : vtekNumber,
                            UserRegistration.vtekDate : vtekDate,
                            UserRegistration.vtekFirstPhotoUrl : "",
                            UserRegistration.vtekSecondPhotoUrl : "",
                            UserRegistration.region : region,
                            UserRegistration.confirmation : false,
                            UserRegistration.role : "user"
                        ])
                        if let profilePhoto = self.profilePhotoImage.image {
                            self.uploadPhoto(currentUserId: userID, image: profilePhoto, path: PhotoStorage.profilePhotos) { (photoResult) in
                                switch photoResult {
                                case .success(let url):
                                    let referenceDatabase = Database.database().reference().child(DatabaseTable.usersDB)
                                    referenceDatabase.child(userID).updateChildValues([UserRegistration.profilePhotoUrl : url.absoluteString])
                                case .failure(_):
                                    return
                                }
                            }
                        }
                        if let passportFirstPhoto = self.passportFirstTempImage {
                            self.uploadPhoto(currentUserId: userID, image: passportFirstPhoto, path: PhotoStorage.passportFirstPage) { (photoResult) in
                                switch photoResult {
                                case .success(let url):
                                    let referenceDatabase = Database.database().reference().child(DatabaseTable.usersDB)
                                    referenceDatabase.child(userID).updateChildValues([UserRegistration.passportFirstPageUrl : url.absoluteString])
                                case .failure(_):
                                    return
                                }
                            }
                        } else {
                            confirmationMessage = "Для подтверждения аккаунта необходимо загрузить фотографии паспорта и справки ВТЭК"
                        }
                        if let passportSecondPhoto = self.passportSecondTempImage {
                            self.uploadPhoto(currentUserId: userID, image: passportSecondPhoto, path: PhotoStorage.passportSecondPage) { (photoResult) in
                                switch photoResult {
                                case .success(let url):
                                    let referenceDatabase = Database.database().reference().child(DatabaseTable.usersDB)
                                    referenceDatabase.child(userID).updateChildValues([UserRegistration.passportSecondPageUrl : url.absoluteString])
                                case .failure(_):
                                    return
                                }
                            }
                        } else {
                            confirmationMessage = "Для подтверждения аккаунта необходимо загрузить фотографии паспорта и справки ВТЭК"
                        }
                        if let vtekFirstPhoto = self.vtekFirstTempImage {
                            self.uploadPhoto(currentUserId: userID, image: vtekFirstPhoto, path: PhotoStorage.vtekFirstPage) { (photoResult) in
                                switch photoResult {
                                case .success(let url):
                                    let referenceDatabase = Database.database().reference().child(DatabaseTable.usersDB)
                                    referenceDatabase.child(userID).updateChildValues([UserRegistration.vtekFirstPhotoUrl : url.absoluteString])
                                case .failure(_):
                                    return
                                }
                            }
                        } else {
                            confirmationMessage = "Для подтверждения аккаунта необходимо загрузить фотографии паспорта и справки ВТЭК"
                        }
                        if let vtekSecondPhoto = self.vtekSecondTempImage {
                            self.uploadPhoto(currentUserId: userID, image: vtekSecondPhoto, path: PhotoStorage.vtekSecondPage) { (photoResult) in
                                switch photoResult {
                                case .success(let url):
                                    let referenceDatabase = Database.database().reference().child(DatabaseTable.usersDB)
                                    referenceDatabase.child(userID).updateChildValues([UserRegistration.vtekSecondPhotoUrl : url.absoluteString])
                                case .failure(_):
                                    return
                                }
                            }
                        } else {
                            confirmationMessage = "Для подтверждения аккаунта необходимо загрузить фотографии паспорта и справки ВТЭК"
                        }
                        Database.database().reference().child(DatabaseTable.usersDB).child(userID).updateChildValues([UserRegistration.confirmationReason : confirmationMessage])
                    }
                    
                    self.alert.showAlert(from: self, title: "Вы успешно зарегистрировались", message: "Ожидайте верификации аккаунта. Информация появится в личном кабинете") {
                        self.dismiss(animated: true, completion: nil)
                    }
                } else {
                    self.alert.showAlert(from: self, title: "", message: "Пользователь с таким E-mail уже существует")
                }
            }
        }
    }
    
    private func uploadPhoto(currentUserId: String,
                             image: UIImage,
                             path: String,
                             completion: @escaping (Result<URL, Error>) -> Void) {
        let ref = Storage.storage().reference().child(path).child(currentUserId)
        guard let imageData = image.jpegData(compressionQuality: 0.4) else {
            return
        }
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        ref.putData(imageData, metadata: metadata) { (metadata, error) in
            guard let _ = metadata else {
                completion(.failure(error!))
                return
            }
            ref.downloadURL { (url, error) in
                guard let url = url else {
                    completion(.failure(error!))
                    return
                }
                completion(.success(url))
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
                    alert.showAlert(from: self, title: "", message: "Необходимо заполнить все обязательные поля")
                    isNotEmptyOrUnselected = false
                }
            }
        }
        switches.forEach { item in
            if let item = item {
                if !item.isOn {
                    alert.showAlert(from: self, title: "", message: "Необходимо дать согласие на обработку персональных данных и подтвердить достоверность передачи информации")
                    isNotEmptyOrUnselected = false
                }
            }
        }
        return isNotEmptyOrUnselected
    }
    
    private func checkForPassword() -> Bool {
        if let pass = passwordField.text, let applyPass = applyPasswordField.text {
            if pass != applyPass {
                alert.showAlert(from: self, title: "", message: "Пароли не совпадают")
                return false
            }
            if pass.count < 6 {
                alert.showAlert(from: self, title: "", message: "Пароль должен содержать минимум 6 символов")
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
                alert.showAlert(from: self, title: "", message: "Необходимо ввести корректный E-mail")
            }
            return evalEmailTest
        }
        return false
    }
    
    @objc private func loadProfilePhotoPressed() {
        callImagePickerController(title: LoadButton.loadProfileButton)
    }
    
    @objc private func loadPassportFirstPhotoPressed() {
        callImagePickerController(title: LoadButton.loadPassportFirstPage)
    }
    
    @objc private func loadPassportSecondPhotoPressed() {
        callImagePickerController(title: LoadButton.loadPassportSecondPage)
    }
    
    @objc private func loadVtekFirstPhotoPressed() {
        callImagePickerController(title: LoadButton.loadVtekFirstPage)
    }
    
    @objc private func loadVtekSecondPhotoPressed() {
        callImagePickerController(title: LoadButton.loadVtekSecondPage)
    }
    
    private func callImagePickerController(title: String?) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.title = title
        present(imagePickerController, animated: true, completion: nil)
    }
    
    private func setAndSaveImage(title: String?, image: UIImage) {
        if title == LoadButton.loadProfileButton {
            profilePhotoImage.image = image
        }
        if title == LoadButton.loadPassportFirstPage {
            passportFirstTempImage = image
            passportFirstImage.image = UIImage(named: "documentLoadColor")
        }
        if title == LoadButton.loadPassportSecondPage {
            passportSecondTempImage = image
            passportSecondImage.image = UIImage(named: "documentLoadColor")
        }
        if title == LoadButton.loadVtekFirstPage {
            vtekFirstTempImage = image
            vtekFirstImage.image = UIImage(named: "documentLoadColor")
        }
        if title == LoadButton.loadVtekSecondPage {
            vtekSecondTempImage = image
            vtekSecondImage.image = UIImage(named: "documentLoadColor")
        }
    }
}

extension RegisterViewController: UINavigationControllerDelegate,  UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        setAndSaveImage(title: picker.title, image: image)
    }
}
