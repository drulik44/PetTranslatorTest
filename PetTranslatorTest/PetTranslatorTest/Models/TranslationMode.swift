//
//  TranslationMode.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 09.02.2025.
//


enum TranslationMode {
    case humanToPet
    case petToHuman

    var text: (left: String, right: String) {
        switch self {
        case .humanToPet: return ("HUMAN", "PET")
        case .petToHuman: return ("PET", "HUMAN")
        }
    }
}
