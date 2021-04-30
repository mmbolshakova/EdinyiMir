//
//  MenuItems.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 21.04.2021.
//

import Foundation
import UIKit

struct MenuItem {
    let iconImage: UIImage?
    let title: String
    
    init(iconImage: UIImage?, title: String) {
        self.iconImage = iconImage
        self.title = title
    }
}

class MenuItems {
    var menuItemsArray: [MenuItem] = []
    
    init() {
        menuItemsSetup()
    }
    
    func menuItemsSetup() {
        menuItemsArray.append(MenuItem(iconImage: UIImage(named: "news"), title: "Новости"))
        menuItemsArray.append(MenuItem(iconImage: UIImage(named: "galery"), title: "Галерея"))
        menuItemsArray.append(MenuItem(iconImage: UIImage(named: "job"), title: "Работа"))
        menuItemsArray.append(MenuItem(iconImage: UIImage(named: "ads"), title: "Реклама"))
        menuItemsArray.append(MenuItem(iconImage: UIImage(named: "partners"), title: "Партнеры"))
        menuItemsArray.append(MenuItem(iconImage: UIImage(named: "lawHelp"), title: "Юридическая помощь"))
        menuItemsArray.append(MenuItem(iconImage: UIImage(named: "businessHelp"), title: "Помощь бизнесу"))
    }
}
