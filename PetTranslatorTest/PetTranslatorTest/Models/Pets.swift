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
        "I'm hungry!",
        "Thank you for being my best friend.",
        "What are you doing, human?",
        "This carpet is so soft.Can I sleep here for a while?"
    ]
    
    private let catPhrases: [String] = [
        "I’m hungry, feed me!",
        "I'm the king of this house!",
        "Purr... I like this!",
        "Could you play with me a little?",
        "I love it when you pet me behind the ear."
    ]
    private let dogSounds: [String] = [
           "dogSound1",  
           "dogSound2",
           "dogSound3",
           "dogSound4"
       ]
       
       private let catSounds: [String] = [
           "catSound1",
           "catSound2",
           "catSound3",
           "catSound4"
       ]
    func getPhrase(for animal: AnimalType) -> String {
        switch animal {
        case .dog:
            return dogPhrases.randomElement() ?? "Woof!"
        case .cat:
            return catPhrases.randomElement() ?? "Meow!"
        }
    }
    func getSound(for animal: AnimalType) -> String {
           switch animal {
           case .dog:
               return dogSounds.randomElement() ?? "dogSound1"
           case .cat:
               return catSounds.randomElement() ?? "catSound1"
           }
       }
}
