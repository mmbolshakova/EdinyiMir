//
//  UIImageView.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 21.04.2021.
//

import Foundation
import UIKit

extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}
