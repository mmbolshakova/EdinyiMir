//
//  RegisterViewController.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 26.04.2021.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK: - Provate Variables
    private let regions = [" ", "Крымское РО", "г. Москва", "Петербургское РО", "Челябинское РО", "Чеченское РО"]
    private var idRegion: Int = 0
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.backgroundColor = Colors.backgroundColor
        setupPersonalInfoView()
        setupContactsView()
        setupPassportInfoView()
        setupVtekView()
        setupRegionView()
        setupAgreementsView()
        
        regionPickerView.delegate = self
        regionPickerView.dataSource = self
    
    }

    private func setupPersonalInfoView() {
        scrollView.backgroundColor = Colors.backgroundColor
        profileView.backgroundColor = Colors.secondaryBackgroundColor
        
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.calendar.locale = Locale(identifier: "ru_RU")
        
        loadProfilePhotoButton.titleLabel?.textAlignment = .center
    }
    
    private func setupContactsView() {
        contactsView.backgroundColor = Colors.secondaryBackgroundColor
    }
    
    private func setupPassportInfoView() {
        passportView.backgroundColor = Colors.secondaryBackgroundColor
        
        whenIssuedDatePicker.locale = Locale(identifier: "ru_RU")
        whenIssuedDatePicker.calendar.locale = Locale(identifier: "ru_RU")
        
        loadfirstPageButton.titleLabel?.textAlignment = .center
        loadregistrationPageButton.titleLabel?.textAlignment = .center
    }
    
    private func setupVtekView() {
        vtekView.backgroundColor = Colors.secondaryBackgroundColor
        
        loadfirstVtekButton.titleLabel?.textAlignment = .center
        loadSecondVtekButton.titleLabel?.textAlignment = .center
    }
    
    private func setupRegionView() {
        regionView.backgroundColor = Colors.secondaryBackgroundColor
    }
    
    private func setupAgreementsView() {
        agreementsView.backgroundColor = Colors.secondaryBackgroundColor
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
        }
}
