//
//  RegisterViewController.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 26.04.2021.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.backgroundColor = Colors.backgroundColor
        profileView.backgroundColor = Colors.secondaryBackgroundColor
        datePicker.locale = Locale(identifier: "ru_RU")
    }

}
