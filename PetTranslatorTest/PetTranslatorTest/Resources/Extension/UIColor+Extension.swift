//
//  UIColor+Extension.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 06.02.2025.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex rgbValue: UInt64) {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
