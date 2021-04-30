//
//  MenuViewController.swift
//  EdinyiMir
//
//  Created by Maria Bolshakovaon 23.04.2021.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var mooiLabel: UILabel!
    
    private var menuItemsArray: [MenuItem] = []
    private let cellId = "menuCell"
    private var menuItems = MenuItems()
    private let nib = UINib(nibName: "MenuTableViewCell", bundle: nil)
    override func viewDidLoad() {
        super.viewDidLoad()

        setupColors()
        menuItemsArray = menuItems.menuItemsArray
        menuItemsArray.forEach { item in
            item.iconImage?.withTintColor(.systemRed, renderingMode: .alwaysTemplate)
        }
        menuTableView.register(nib, forCellReuseIdentifier: cellId)
        menuTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: menuTableView.frame.size.width, height: 1))
        menuTableView.separatorColor = .systemGray4
        menuTableView.separatorInset.left = 75
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
    }
    
    private func setupColors() {
        mainView.backgroundColor = Colors.secondaryBackgroundColor
        menuTableView.backgroundColor = Colors.backgroundColor
        
        mooiLabel.textColor = Colors.labelColor
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuItemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MenuTableViewCell
        let selectedView = UIView()
        selectedView.backgroundColor = .systemGray4
        if let itemImage = menuItemsArray[indexPath.row].iconImage {
            cell.iconImage.image = itemImage
        }
        cell.titleLabel.text = menuItemsArray[indexPath.row].title
        cell.selectedBackgroundView = selectedView
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
