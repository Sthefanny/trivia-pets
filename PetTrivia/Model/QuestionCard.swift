//
//  QuestionCard.swift
//  PetTrivia
//
//  Created by Pablo Penas on 18/06/21.
//

import Foundation

struct Option: Identifiable {
    var id = UUID()
    let option: String
    
    init(option: String) {
        self.option = option
    }
}

class QuestionCard {
    let category: QuestionCategory
    let description: String
    let options: [Option]
    let correctOption: Int
    let questionId: Int
    let note: String?
    
    
    init(category: QuestionCategory, description: String, options: [String], correctOption: Int, questionId: Int, note: String?) {
        self.category = category
        self.description = description
        self.options = [
            Option(option: "A. \(options[0])"),
            Option(option: "B. \(options[1])"),
            Option(option: "C. \(options[2])"),
            Option(option: "D. \(options[3])"),
        ]
        self.correctOption = correctOption
        self.questionId = questionId
        self.note = note
    }
}

enum QuestionCategory: String {
    case naturalDiet = "Alimentação Natural"
    case allowedFood = "Comidas Permitidas"
    case environmentalEnrichment = "Enriquecimento Ambiental"
    case allOptions = "Um Pouco de Tudo"
}
