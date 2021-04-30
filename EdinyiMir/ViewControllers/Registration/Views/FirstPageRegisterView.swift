//
//  FirstPageRegisterView.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 26.04.2021.
//

import UIKit

class FirstPageRegisterView: UIView {

    func createPages() -> [FirstPageRegisterView] {
        let page1: FirstPageRegisterView = FirstPageRegisterView()
        let page2: FirstPageRegisterView = FirstPageRegisterView()
        return [page1, page2]
    }

}
