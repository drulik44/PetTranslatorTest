//
//  SettingsOption.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 10.02.2025.
//


import UIKit

enum SettingsOption: CaseIterable {
    case rateUs
    case shareApp
    case contactUs
    case restorePurchases
    case privacyPolicy
    case termsOfUse

    var title: String {
        switch self {
        case .rateUs: return "Rate Us"
        case .shareApp: return "Share App"
        case .contactUs: return "Contact Us"
        case .restorePurchases: return "Restore Purchases"
        case .privacyPolicy: return "Privacy Policy"
        case .termsOfUse: return "Terms of Use"
        }
    }

    var icon: UIImage? {
        return UIImage(named: "arrow-right") 
    }
}
