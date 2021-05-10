//
//  PersonalViewController.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 23.04.2021.
//

import UIKit
import Firebase
import SnapKit

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
    private var isEditSelected: Bool = false
    private let regions = [" ", "Крымское РО", "г. Москва", "Петербургское РО", "Челябинское РО", "Чеченское РО"]
    private var idRegion: Int = 0
    private var selectedRegion: String?
    
    //MARK: - MainView
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
    
    //MARK: - PassportView
    @IBOutlet weak var passportView: UIView!
    
    @IBOutlet weak var passportSeriaLabel: UILabel!
    @IBOutlet weak var passportSeriaTextField: UITextField!
    @IBOutlet weak var passportSeria: UILabel!
    
    @IBOutlet weak var passportNumberLabel: UILabel!
    @IBOutlet weak var passportNumberField: UITextField!
    @IBOutlet weak var passportNumber: UILabel!
    
    @IBOutlet weak var issuedByLabel: UILabel!
    @IBOutlet weak var issuedByField: UITextField!
    @IBOutlet weak var issuedBy: UILabel!
    
    @IBOutlet weak var whenIssuedLabel: UILabel!
    @IBOutlet weak var whenIssuedDatePicker: UIDatePicker!
    @IBOutlet weak var whenIssued: UILabel!
    
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var code: UILabel!
    
    @IBOutlet weak var passportFirstPageImage: UIImageView!
    @IBOutlet weak var loadFirstPagePhotoButton: UIButton!
    
    @IBOutlet weak var passportSecondPageImage: UIImageView!
    @IBOutlet weak var loadSecondPagePhotoButton: UIButton!
    
    //MARK: - VtekView
    @IBOutlet weak var vtekView: UIView!
    
    @IBOutlet weak var vtekSeriaLabel: UILabel!
    @IBOutlet weak var vtekSeriaField: UITextField!
    @IBOutlet weak var vtekSeria: UILabel!
    
    @IBOutlet weak var vtekNumberLabel: UILabel!
    @IBOutlet weak var vtekNumberField: UITextField!
    @IBOutlet weak var vtekNumber: UILabel!
   
    @IBOutlet weak var vtekDateLabel: UILabel!
    @IBOutlet weak var vtekDateField: UITextField!
    @IBOutlet weak var vtekDate: UILabel!
    
    @IBOutlet weak var vtekFirstImage: UIImageView!
    @IBOutlet weak var loadVtekFirstPhotoButton: UIButton!
    
    @IBOutlet weak var vtekSecondImage: UIImageView!
    @IBOutlet weak var loadVtekSecondPhotoButton: UIButton!
    
    //MARK: - RegionView
    @IBOutlet weak var regionView: UIView!
    
    @IBOutlet weak var regionPickerView: UIPickerView!
    @IBOutlet weak var region: UILabel!
    
    //MARK: - ControlButtonsView
    @IBOutlet weak var controlButtonsView: UIView!
    @IBOutlet weak var separatorView: UIView!
    
    @IBOutlet weak var firstControlButton: UIButton!
    @IBOutlet weak var secondControlButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        isEditSelected = false
        setupColors()
        
        setupConfirmationView()
        setupProfileView()
        setupContactsView()
        setupLabelColors()
        setupPassportView()
        setupVtekView()
        setupRegionView()
        setupControlButtonsView()
        
        editing()
        
        regionPickerView.delegate = self
        regionPickerView.dataSource = self
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
    private func setupLabelColors() {
        let labelsArray = [lastNameLabel, firstNameLabel, otherNameLabel, birthdayLabel, phoneLabel, emailLabel, passportSeriaLabel, passportNumberLabel, issuedByLabel, whenIssuedLabel, codeLabel, vtekSeriaLabel, vtekNumberLabel, vtekDateLabel]
        labelsArray.forEach { label in
            label?.textColor = Colors.customGray
        }
    }
    
    private func editing() {
        let labelsArray = [lastName, firstName, otherName, birthday, phone, email, passportSeria, passportNumber, issuedBy, whenIssued, code, vtekSeria, vtekNumber, vtekDate, region]
        let fieldsArray = [lastNameField, firstNameField, otherNameField, birthdayDatePicker, phoneField, emailField, passportSeriaTextField, passportNumberField, issuedByField, whenIssuedDatePicker, codeField, vtekSeriaField, vtekNumberField, vtekDateField, regionPickerView]
        labelsArray.forEach { label in
            label?.isHidden = self.isEditSelected
        }
        fieldsArray.forEach { field in
            field?.isHidden = !self.isEditSelected
        }
        
        confirmationView.isHidden = self.isEditSelected
        loadProfilePhotoButton.isHidden = !self.isEditSelected
        profileView.snp.makeConstraints { make in
            if self.isEditSelected {
                make.top.equalToSuperview().offset(Const.indent)
            } else {
                make.top.equalTo(confirmationView.snp.bottom).offset(Const.indent)
            }
        }
        
        loadFirstPagePhotoButton.isHidden = !self.isEditSelected
        loadSecondPagePhotoButton.isHidden = !self.isEditSelected
        passportView.snp.makeConstraints { make in
            make.height.equalTo(self.isEditSelected ? Const.passportViewFullHeight : Const.passportViewHeight)
        }
        
        loadVtekFirstPhotoButton.isHidden = !self.isEditSelected
        loadVtekSecondPhotoButton.isHidden = !self.isEditSelected
        vtekView.snp.makeConstraints { make in
            make.height.equalTo(self.isEditSelected ? Const.vtekViewFullHeight : Const.vtekViewHeight)
        }
        
        regionView.snp.makeConstraints { make in
            make.height.equalTo(self.isEditSelected ? Const.regionViewFullHeight : Const.regionViewHeight)
        }
        
        firstControlButton.setTitle(self.isEditSelected ? "СОХРАНИТЬ" : "РЕДАКТИРОВАТЬ", for: .normal)
        firstControlButton.setTitleColor(self.isEditSelected ? .systemGreen : .systemBlue, for: .normal)
        secondControlButton.setTitle(self.isEditSelected ? "ОТМЕНА" : "ВЫЙТИ", for: .normal)
        secondControlButton.setTitleColor(self.isEditSelected ? .systemBlue : .systemRed, for: .normal)
    }
    
    private func setupConfirmationView() {
        confirmationView.backgroundColor = Colors.secondaryBackgroundColor
        confirmImageView.tintColor = .green
    }
    
    private func setupProfileView() {
        profileView.backgroundColor = Colors.secondaryBackgroundColor
        
        loadProfilePhotoButton.titleLabel?.textAlignment = .center
        profilePhoto.center = view.center
    }
    
    private func setupContactsView() {
        contactsView.backgroundColor = Colors.secondaryBackgroundColor
    }
    
    private func setupPassportView() {
        passportView.backgroundColor = Colors.secondaryBackgroundColor
        loadFirstPagePhotoButton.titleLabel?.textAlignment = .center
        loadSecondPagePhotoButton.titleLabel?.textAlignment = .center
    }
    
    private func setupVtekView() {
        vtekView.backgroundColor = Colors.secondaryBackgroundColor
        loadVtekFirstPhotoButton.titleLabel?.textAlignment = .center
        loadVtekSecondPhotoButton.titleLabel?.textAlignment = .center
    }
    
    private func setupRegionView() {
        regionView.backgroundColor = Colors.secondaryBackgroundColor
    }
    
    private func setupControlButtonsView() {
        controlButtonsView.backgroundColor = Colors.secondaryBackgroundColor
        separatorView.backgroundColor = Colors.backgroundColor
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
