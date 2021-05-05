//
//  TabBarViewController.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 23.04.2021.
//

import UIKit
import SnapKit

class TabBarViewController: UITabBarController {
    
    @IBOutlet weak var mainTabBar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupColors()
        setupTabBarShadow()
    }
    

    private func setupTabBarShadow() {
        mainTabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        mainTabBar.layer.shadowRadius = 2.0
        mainTabBar.layer.shadowColor = UIColor.gray.cgColor
        mainTabBar.layer.shadowOpacity = 0.6
    }
    
    private func setupColors() {
        mainTabBar.unselectedItemTintColor = Colors.customGray
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Colors.labelColor], for: .selected)
        mainTabBar.barTintColor = Colors.secondaryBackgroundColor
        mainTabBar.tintColor = Colors.mainCustomBlueColor
    }
}
