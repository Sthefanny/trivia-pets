//
//  QuestionBank.swift
//  PetTrivia
//
//  Created by Pablo Penas on 18/06/21.
//

import Foundation

class QuestionBank {
    static var instance = QuestionBank()
    var questionList = [QuestionCard]()
    
    init() {
        questionList.append(QuestionCard(
                                category: "Alimentação Natural",
                                description: "Esse é um modelo de pergunta teste usado para o Question Bank",
                                options: ["Muito Legal","Legal","Pouco Legal","Nada Legal"],
                                correctOption: 1))
    }
    
}
