//
//  GameView.swift
//  PetTrivia
//
//  Created by Pablo Penas on 18/06/21.
//

import SwiftUI

struct GameView: View {
    @State var timeRemaining = 60
    @State var currentPosition = 1
    @State var selectedOptions: [Int] = []
    @State var disabledButton = false
    @State var guessedRight: [Int] = []
    
    func fetchData() {
        let data = UserDefaultsWrapper.fetchUserInfo()?.guessedRight ?? []
        self.guessedRight = data
    }
    
    func questionFilter(category: String, questions: [QuestionCard]) -> [QuestionCard] {
        var actual: [QuestionCard] = []
        for i in questions {
            if i.category == category {
                actual.append(i)
            }
        }
        return actual
    }
    
    var questions = QuestionBank.instance.questionList
    let currentCategory: String
    let actual = questionFilter()

    var body: some View {
//        Color("BackgroundColor")
        Image("GameBackground")
            .resizable()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .ignoresSafeArea(edges: .all)
            .overlay(
                VStack {
                    TimerView(timeRemaining: $timeRemaining, disabledButton: $disabledButton)
                    ProgressionView(currentQuestion: $currentPosition, selectedOptions: $selectedOptions, correctOptions: [1,1,1,1,1])
                    Text(currentCategory)
                        .font(.custom("Helvetica Neue", size: 34))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(Color("BlueCardTextColor"))
                    QuestionCardView(currentPosition: $currentPosition, selectedOptions: $selectedOptions, timeRemaining: $timeRemaining, disabledButton: $disabledButton, guessedRight: $guessedRight, questions: questions, question: questions[currentPosition - 1])
                }
            )
            .onAppear {
                self.fetchData()
            }
    }
    
    init(currentCategory: String) {
        self.currentCategory = currentCategory
//        self.questions.filter { question in question.category == currentCategory && !guessedRight.contains(question.questionId)}
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(currentCategory: "Alimentação Natural")
    }
}
