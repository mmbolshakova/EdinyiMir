//
//  PersonalViewController.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 23.04.2021.
//

import UIKit
import Firebase
import SnapKit
import RNCryptor
import CryptoSwift

private struct Const {
    static let indent: CGFloat = 20.0
    
    static let passportViewHeight: CGFloat = 410.0
    static let passportViewFullHeight: CGFloat = 470.0
    
    static let vtekViewFullHeight: CGFloat = 370.0
    static let vtekViewHeight: CGFloat = 310.0
    
    static let regionViewFullHeight: CGFloat = 120.0
    static let regionViewHeight: CGFloat = 80.0
}

//MARK: - ComeIntView
class PersonalViewController: UIViewController {
    //MARK: - PrivateVariables
    private var common = CommonFunctions()
    private let regions = [" ", "Крымское РО", "г. Москва", "Петербургское РО", "Челябинское РО", "Чеченское РО"]
    private var idRegion: Int = 0
    private var selectedRegion: String?
    private var userUID: String?
    private var currentUser: User? {
        didSet {
            let defaults = UserDefaults.standard
            if let userUID = defaults.string(forKey: DefaultsKeys.userUid), userUID != "" {
                self.userUID = userUID
                hideOrShowViews(isUID: true)
            } else {
                hideOrShowViews(isUID: false)
            }
            setupUserData()
        }
    }
    //MARK: - MainView
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var personalInfoView: UIView?
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var statusBarView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var comeInView: UIView?
    @IBOutlet weak var comeToProfileLabel: UILabel!
    @IBOutlet weak var mooiLabel: UILabel!
    
    //MARK: - ConfirmationView
    @IBOutlet weak var confirmationView: UIView!
    @IBOutlet weak var confirmImageView: UIImageView!
    @IBOutlet weak var confirmation: UILabel!
    
    //MARK: - ProfileView
    @IBOutlet weak var profileView: UIView!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstName: UILabel!
    
    @IBOutlet weak var otherNameLabel: UILabel!
    @IBOutlet weak var otherName: UILabel!
    @IBOutlet weak var otherNameView: UIView!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var birthday: UILabel!
    
    @IBOutlet weak var profilePhoto: UIImageView!
    
    
    //MARK: - ContactsView
    @IBOutlet weak var contactsView: UIView!
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var email: UILabel!
    
    //MARK: - PassportView
    @IBOutlet weak var passportView: UIView!
    
    @IBOutlet weak var passportSeriaLabel: UILabel!
    @IBOutlet weak var passportSeria: UILabel!
    
    @IBOutlet weak var passportNumberLabel: UILabel!
    @IBOutlet weak var passportNumber: UILabel!
    
    @IBOutlet weak var issuedByLabel: UILabel!
    @IBOutlet weak var issuedBy: UILabel!
    
    @IBOutlet weak var whenIssuedLabel: UILabel!
    @IBOutlet weak var whenIssued: UILabel!
    
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var code: UILabel!
    
    @IBOutlet weak var passportFirstPageImage: UIImageView!
    
    @IBOutlet weak var passportSecondPageImage: UIImageView!
    
    //MARK: - VtekView
    @IBOutlet weak var vtekView: UIView!
    
    @IBOutlet weak var vtekSeriaLabel: UILabel!
    @IBOutlet weak var vtekSeria: UILabel!
    
    @IBOutlet weak var vtekNumberLabel: UILabel!
    @IBOutlet weak var vtekNumber: UILabel!
   
    @IBOutlet weak var vtekDateLabel: UILabel!
    @IBOutlet weak var vtekDate: UILabel!
    
    @IBOutlet weak var vtekFirstImage: UIImageView!
    
    @IBOutlet weak var vtekGroupLabel: UILabel!
    @IBOutlet weak var vtekGroup: UILabel!
    
    
    @IBOutlet weak var vtekSecondImage: UIImageView!
    
    //MARK: - RegionView
    @IBOutlet weak var regionView: UIView!
    
    @IBOutlet weak var region: UILabel!
    
    //MARK: - ControlButtonsView
    @IBOutlet weak var controlButtonsView: UIView!
    @IBOutlet weak var separatorView: UIView!
    
    @IBOutlet weak var firstControlButton: UIButton!
    @IBOutlet weak var secondControlButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().addStateDidChangeListener { auth, user in
          if let user = user {
            self.getJsonTasks(idUser: user.debugDescription)
          } else {
            self.logOutButtonPressed()
          }
        }
        setupColors()
        
        setupConfirmationView()
        setupProfileView()
        setupContactsView()
        setupLabelColors()
        setupPassportView()
        setupVtekView()
        setupRegionView()
        setupControlButtonsView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainScrollView.contentOffset = CGPoint(x:0, y:0)
//        logOutButtonPressed()
        let defaults = UserDefaults.standard
        if let userUID = defaults.string(forKey: DefaultsKeys.userUid), userUID != "" {
            getJsonTasks(idUser: userUID)
            comeInView?.isHidden = true
            personalInfoView?.isHidden = true
        } else {
            hideOrShowViews(isUID: false)
        }
    }
    
    func hideOrShowViews(isUID: Bool) {
        comeInView?.isHidden = isUID
        personalInfoView?.isHidden = !isUID
        
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
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func register(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
    private func setupDataToConfirmationView(confirm: Bool, reason: String?) {
        if confirm {
            confirmImageView.image = UIImage(named: "verified")
            confirmImageView.tintColor = .systemGreen
            confirmation.text = "Профиль подтвержден"
        } else {
            confirmImageView.image = UIImage(named: "notVerified")
            confirmImageView.tintColor = .systemRed
            if let reason = reason {
                confirmation.text = "Профиль не подтвержден. " + reason
            }
        }
    }
    
    private func setupUserData() {
        if let currentUser = currentUser {
            print("🦖 \(currentUser.passportSecondPageUrl)")
            self.lastName.text = currentUser.lastName
            self.firstName.text = currentUser.firstName
            if currentUser.otherName.isNilOrEmpty {
                otherNameView.isHidden = true
            } else {
                self.otherName.text = currentUser.otherName
            }
            self.birthday.text = currentUser.birthday
            self.phone.text = currentUser.phone
            self.email.text = currentUser.email
            self.passportSeria.text = currentUser.passportSeria
            self.passportNumber.text = currentUser.passportNumber
            self.issuedBy.text = currentUser.passportIssuedBy
            self.whenIssued.text = currentUser.passportWhenIssued
            common.setupImage(with: currentUser.profilePhotoUrl, for: self.profilePhoto, defaultImage: UIImage(systemName: "person.crop.circle.fill")!)
            self.code.text = currentUser.passportCode
            common.setupImage(with: currentUser.passportFirstPageUrl, for: self.passportFirstPageImage, defaultImage: UIImage(named: "documentNotLoad")!)
            common.setupImage(with: currentUser.passportSecondPageUrl, for: self.passportSecondPageImage, defaultImage: UIImage(named: "documentNotLoad")!)
            self.vtekSeria.text = currentUser.vtekSeria
            self.vtekNumber.text = currentUser.vtekNumber
            self.vtekDate.text = currentUser.vtekDateIsIndefinite ? "Бессрочно" : currentUser.vtekDate
            self.vtekGroup.text = currentUser.vtekGroup
            common.setupImage(with: currentUser.vtekFirstPhotoUrl, for: self.vtekFirstImage, defaultImage: UIImage(named: "documentNotLoad")!)
            common.setupImage(with: currentUser.vtekSecondPhotoUrl, for: self.vtekSecondImage, defaultImage: UIImage(named: "documentNotLoad")!)
            self.region.text = currentUser.region
            setupDataToConfirmationView(confirm: currentUser.confirmation, reason: currentUser.confirmationReason)
        }
    }
    
    private func getJsonTasks(idUser: String) {
        let refQuery = Database.database().reference().child(DatabaseTable.usersDB)
        refQuery.observeSingleEvent(of: .value) { (snapshot) in
            if let snap = snapshot.childSnapshot(forPath: idUser) as? DataSnapshot {
                if let dict = snap.value as? [String:AnyObject] {
                    let user = User(lastName: dict[UserRegistration.lastName] as? String ?? "",
                                            firstName: dict[UserRegistration.firstName] as? String ?? "",
                                            otherName: dict[UserRegistration.otherName] as? String ?? "",
                                            birthday: dict[UserRegistration.birthday] as? String ?? "",
                                            phone: dict[UserRegistration.phone] as? String ?? "",
                                            email: dict[UserRegistration.email] as? String ?? "",
                                            passportSeria: dict[UserRegistration.passportSeria] as? String ?? "",
                                            passportNumber: dict[UserRegistration.passportNumber] as? String ?? "",
                                            passportIssuedBy: dict[UserRegistration.passportIssuedBy] as? String ?? "",
                                            passportWhenIssued: dict[UserRegistration.passportWhenIssued] as? String ?? "",
                                            profilePhotoUrl: dict[UserRegistration.profilePhotoUrl] as? String ?? "",
                                            passportCode: dict[UserRegistration.passportCode] as? String ?? "",
                                            passportFirstPageUrl: dict[UserRegistration.passportFirstPageUrl] as? String ?? "",
                                            passportSecondPageUrl: dict[UserRegistration.passportSecondPageUrl] as? String ?? "",
                                            vtekSeria: dict[UserRegistration.vtekSeria] as? String ?? "",
                                            vtekNumber: dict[UserRegistration.vtekNumber] as? String ?? "",
                                            vtekDate: dict[UserRegistration.vtekDate] as? String ?? "",
                                            vtekDateIsIndefinite: dict[UserRegistration.vtekDateIsIndefinite] as! Bool,
                                            vtekGroup: dict[UserRegistration.vtekGroup] as? String ?? "",
                                            vtekFirstPhotoUrl: dict[UserRegistration.vtekFirstPhotoUrl] as? String ?? "",
                                            vtekSecondPhotoUrl: dict[UserRegistration.vtekSecondPhotoUrl] as? String ?? "",
                                            region: dict[UserRegistration.region] as? String ?? "",
                                            confirmation: dict[UserRegistration.confirmation] as! Bool,
                                            confirmationReason: dict[UserRegistration.confirmationReason] as? String ?? "",
                                            role: dict[UserRegistration.role] as? String ?? "")
                    self.currentUser = user
                }
            }
        }
    }
}

//MARK: - PersonalInfoView
extension PersonalViewController {
    private func setupLabelColors() {
        let labelsArray = [lastNameLabel, firstNameLabel, otherNameLabel, birthdayLabel, phoneLabel, emailLabel, passportSeriaLabel, passportNumberLabel, issuedByLabel, whenIssuedLabel, codeLabel, vtekSeriaLabel, vtekNumberLabel, vtekGroupLabel, vtekDateLabel]
        labelsArray.forEach { label in
            label?.textColor = Colors.customGray
        }
    }
    
    private func setupConfirmationView() {
        confirmationView.isHidden = false
        confirmationView.backgroundColor = Colors.secondaryBackgroundColor
        confirmImageView.tintColor = .green
    }
    
    private func setupProfileView() {
        profileView.backgroundColor = Colors.secondaryBackgroundColor
        
        profilePhoto.center = view.center
    }
    
    private func setupContactsView() {
        contactsView.backgroundColor = Colors.secondaryBackgroundColor
    }
    
    private func setupPassportView() {
        passportView.backgroundColor = Colors.secondaryBackgroundColor
    }
    
    private func setupVtekView() {
        vtekView.backgroundColor = Colors.secondaryBackgroundColor
    }
    
    private func setupRegionView() {
        regionView.backgroundColor = Colors.secondaryBackgroundColor
    }
    
    private func setupControlButtonsView() {
        controlButtonsView.backgroundColor = Colors.secondaryBackgroundColor
        separatorView.backgroundColor = Colors.backgroundColor
        
        firstControlButton.addTarget(self, action: #selector(editButtonPressed), for: .touchUpInside)
        secondControlButton.addTarget(self, action: #selector(logOutButtonPressed), for: .touchUpInside)
    }
    
    @objc private func logOutButtonPressed() {
        common.clearUserDefaults()
        do {
            try Auth.auth().signOut()
            hideOrShowViews(isUID: false)
        } catch {
            print(error)
        }
    }
    
    @objc private func editButtonPressed() {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        {
            vc.currentUser = currentUser
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
}

extension PersonalViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
