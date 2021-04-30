//
//  MenuTableViewCell.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 20.04.2021.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupColors()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupColors() {
        self.backgroundColor = Colors.backgroundColor
        iconImage.tintColor = Colors.mainCustomBlueColor
        titleLabel.textColor = Colors.labelColor
        arrowImage.setImageColor(color: Colors.labelColor)
    }
}
