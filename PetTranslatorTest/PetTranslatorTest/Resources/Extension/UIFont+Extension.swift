//
//  Untitled.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 06.02.2025.
//

import UIKit

extension UIFont {
    enum Konkhmer {
        enum Regular {
            static func size(of size: CGFloat) -> UIFont {
                guard let font = UIFont(name: Constants.Konkhmer.regular, size: size) else {
                    return UIFont.systemFont(ofSize: size)
                }
                return font
            }
        }
    }

    private enum Constants { 
        enum Konkhmer {
            static let regular = "KonkhmerSleokchher-Regular"
        }
    }
}
