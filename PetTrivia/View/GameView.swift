//
//  GameView.swift
//  PetTrivia
//
//  Created by Pablo Penas on 18/06/21.
//

import SwiftUI

struct GameView: View {
    @State var currentPosition = 1
    @State var selectedOptions: [Int] = []
    let questions = QuestionBank.instance.questionList
    let currentCategory: String

    var body: some View {
        Color("BackgroundColor")
            .ignoresSafeArea(edges: .all)
            .overlay(
                VStack {
                    TimerView()
                    ProgressionView(currentQuestion: $currentPosition, selectedOptions: $selectedOptions,correctOptions: [1,1,1,1,1])
                    Text(currentCategory)
                        .font(.custom("Helvetica Neue", size: 34))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(Color("BlueTextColor"))
                    QuestionCardView(currentPosition: $currentPosition, selectedOptions: $selectedOptions, question: questions[currentPosition - 1])
                }
            )
    }
    
    init(currentCategory: String) {
        self.currentCategory = currentCategory
        self.questions.filter { question in question.category == currentCategory}
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(currentCategory: "Alimentação Natural")
    }
}
