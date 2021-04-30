//
//  PersonalViewController.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 23.04.2021.
//

import UIKit

class PersonalViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var statusBarView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var comeInView: UIView!
    @IBOutlet weak var comeToProfileLabel: UILabel!
    @IBOutlet weak var mooiLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupColors()
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
