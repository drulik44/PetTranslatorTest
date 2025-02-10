//
//  Pets.swift
//  PetTranslatorTest
//
//  Created by Руслан Жидких on 07.02.2025.
//

import Foundation

enum AnimalType {
    case dog
    case cat

    var imageName: String {
        switch self {
        case .dog: return "dog"
        case .cat: return "cat"
        }
    }
}
  
class AnimalPhrases {
    private let dogPhrases: [String] = [
        "Woof! I love you!",
        "Let's go for a walk!",
        "I'm hungry!"
    ]
    
    private let catPhrases: [String] = [
        "Meow! Feed me!",
        "I'm the king of this house!",
        "Purr... I like this!"
    ]
    
    func getPhrase(for animal: AnimalType) -> String {
        switch animal {
        case .dog:
            return dogPhrases.randomElement() ?? "Woof!"
        case .cat:
            return catPhrases.randomElement() ?? "Meow!"
        }
    }
}
