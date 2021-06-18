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
    let category: String
    let description: String
    let options: [Option]
    let correctOption: Int
    
    
    init(category: String, description: String, options: [String], correctOption: Int) {
        self.category = category
        self.description = description
        self.options = [
            Option(option: "A. \(options[0])"),
            Option(option: "B. \(options[1])"),
            Option(option: "C. \(options[2])"),
            Option(option: "D. \(options[3])"),
        ]
        self.correctOption = correctOption
    }
}
