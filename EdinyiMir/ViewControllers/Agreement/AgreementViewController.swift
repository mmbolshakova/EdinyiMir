//
//  AgreementViewController.swift
//  EdinyiMir
//
//  Created by 18725610 on 16.05.2021.
//

import UIKit

class AgreementViewController: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        closeButton.addTarget(self, action: #selector(closeButtonPresed), for: .touchUpInside)
    }

    @objc private func closeButtonPresed() {
        dismiss(animated: true, completion: nil)
    }
}
