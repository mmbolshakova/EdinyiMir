//
//  Colors.swift
//  EdinyiMir
//
//  Created by Maria Bolshakova on 21.04.2021.
//

import UIKit
import SwifterSwift

public enum Colors {
    static let mainCustomBlueColor: UIColor = UIColor(red: 27, green: 61, blue: 155)!
    
    /// Серый цвет
    public static let customGray: UIColor = {
        let lightThemeColor = Color.darkGray
        let darkThemeColor = UIColor(red: 235, green: 235, blue: 245)!.withAlphaComponent(0.6)
        let color = UIColor.semanticColor(
            lightThemeColor: lightThemeColor,
            darkThemeColor: darkThemeColor
        )
        return color
    }()
    
    // MARK: - Container Background Colors
    /// Основной фоновый цвет интерфейса (view+navbar)
    public static let backgroundColor: UIColor = {
        let lightThemeColor: UIColor = UIColor(red: 244, green: 246, blue: 247)!
        let darkThemeColor: UIColor = UIColor.black
        let color = UIColor.semanticColor(
            lightThemeColor: lightThemeColor,
            darkThemeColor: darkThemeColor
        )
        return color
    }()
    
    /// Цвет фоновых элементов интерфейса, наложенных на основной фоновый цвет (`Colors.backgroundColor`)
    public static let secondaryBackgroundColor: UIColor = {
        let lightThemeColor: UIColor = UIColor.white
        let darkThemeColor: UIColor = UIColor(red: 28, green: 28, blue: 30)!
        let color = UIColor.semanticColor(
            lightThemeColor: lightThemeColor,
            darkThemeColor: darkThemeColor
        )
        return color
    }()
    
    public static let modalBackgroundColor: UIColor = {
        let lightThemeColor: UIColor = UIColor(red: 244, green: 246, blue: 247)!
        let darkThemeColor: UIColor = UIColor(red: 28, green: 28, blue: 30)!
        let color = UIColor.semanticColor(
            lightThemeColor: lightThemeColor,
            darkThemeColor: darkThemeColor
        )
        return color
    }()
    
    public static let modalSecondaryBackgroundColor: UIColor = {
        let lightThemeColor: UIColor = UIColor.white
        let darkThemeColor: UIColor = UIColor.black
        let color = UIColor.semanticColor(
            lightThemeColor: lightThemeColor,
            darkThemeColor: darkThemeColor
        )
        return color
    }()

    
    // MARK: - Separator
    /// Цвет сепаратора в ячейках таблицы
    public static let separatorColor: UIColor = {
        let lightThemeColor = UIColor(red: 219, green: 219, blue: 219)!
        let darkThemeColor = UIColor(red: 56, green: 56, blue: 58)!
        let color = UIColor.semanticColor(
            lightThemeColor: lightThemeColor,
            darkThemeColor: darkThemeColor
        )
        return color
    }()
    
    // MARK: - System Colors
    /// Черный цвет
    public static let systemBlack: UIColor = {
        let lightThemeColor = UIColor.black
        let darkThemeColor = UIColor.white
        let color = UIColor.semanticColor(
                lightThemeColor: lightThemeColor,
                darkThemeColor: darkThemeColor
        )
        return color
    }()
    
    /// Белый цвет
    public static let systemWhite: UIColor = {
        let lightThemeColor = UIColor.white
        let darkThemeColor = UIColor(red: 238, green: 238, blue: 238)!
        let color = UIColor.semanticColor(
                lightThemeColor: lightThemeColor,
                darkThemeColor: darkThemeColor
        )
        return color
    }()
    
    // MARK: - Label Colors
    /// Цвет основного текста `UILabel`
    public static let labelColor: UIColor = {
        return UIColor.label
    }()

    /// Цвет вторичного текста `UILabel`
    public static let secondaryLabelColor: UIColor = {
        let lightThemeColor = UIColor(red: 168, green: 171, blue: 179)!
        let darkThemeColor = UIColor(red: 235, green: 235, blue: 245)!.withAlphaComponent(0.6)
        let color = UIColor.semanticColor(
                lightThemeColor: lightThemeColor,
                darkThemeColor: darkThemeColor
            )
        return color
    }()
}

// MARK: - Extensions
private extension UIColor {
    /// Функция, которая в зависимости от версии iOS и темы, возвращает нужный цвет.
    /// - Parameters:
    ///     - lightThemeColor: цвет в светлой теме
    ///     - darkThemeColor: цвет в темной теме
    static func semanticColor(lightThemeColor: UIColor, darkThemeColor: UIColor) -> UIColor {
        return UIColor { trait -> UIColor in
            trait.userInterfaceStyle == .dark ? darkThemeColor : lightThemeColor
        }
    }
}
