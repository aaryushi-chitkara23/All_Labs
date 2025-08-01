//
//  Questions.swift
//  PersonalityQuiz
//
//  Created by AARYUSHI on 29/07/25.
//

import Foundation

struct Questions{
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType{
    case single , multiple , ranged
}

struct Answer{
    var text: String
    var type: AnimalType
}

enum AnimalType: Character{
    case lion = "🦁"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String{
        switch self{
        case .lion:
            return " you are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .cat:
            return "Mischievous , yet mild-tempered , you enjoy doing things on your own terms"
        case .rabbit:
            return "You love everything thats soft.You are healthy and full of energy."
        case .turtle:
            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
        }
    }
}
