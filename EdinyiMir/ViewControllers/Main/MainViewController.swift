//
//  MainViewController.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 23.04.2021.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var statusBarView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var infoTextView: UITextView!
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var mooiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupColors()
    }
    
    private func setupColors() {
        mainView.backgroundColor = Colors.backgroundColor
        infoTextView.backgroundColor = Colors.backgroundColor
        mainScrollView.backgroundColor = Colors.backgroundColor
        headerView.backgroundColor = Colors.secondaryBackgroundColor
        statusBarView.backgroundColor = Colors.secondaryBackgroundColor
        infoTextView.textColor = Colors.labelColor
        mooiLabel.textColor = Colors.labelColor
    }

}
