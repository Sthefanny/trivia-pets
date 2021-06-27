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
    @State var didEnd = false
    
    var currentCategory: QuestionCategory
    
    var questions: [QuestionCard] {
        QuestionBank.instance.questionFilter(category: currentCategory, guessedRight: guessedRight)
    }
    func fetchData() {
        let data = UserDefaultsWrapper.fetchUserInfo()?.guessedRight ?? []
        self.guessedRight = data
    }
    
    func checkAnswers(selectedOptions: [Int], questions: [QuestionCard]) -> Int {
        var count = 0
        for i in 0..<selectedOptions.count {
            if selectedOptions[i] == questions[i].correctOption {
                count += 1
            }
        }
        return count
    }
    
    func getCorrectAnswers(questions: [QuestionCard]) -> [Int] {
        var correctAnswers: [Int] = []
        for i in 0...4 {
            correctAnswers.append(questions[i].correctOption)
        }
        return correctAnswers
    }

    var body: some View {
        if didEnd {
            NavigationView {
                Color("BackgroundColor")
                    .ignoresSafeArea(edges: .all)
                    .overlay(
                        EndGameView(result: checkAnswers(selectedOptions: selectedOptions, questions: questions))
                    )
            }
//            .navigationBarHidden(true)
//            .navigationBarBackButtonHidden(true)
        } else {
            Image("GameBackground")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea(edges: .all)
                .overlay(
                    VStack {
                        TimerView(timeRemaining: $timeRemaining, disabledButton: $disabledButton)
                        ProgressionView(currentQuestion: $currentPosition, selectedOptions: $selectedOptions, correctOptions: getCorrectAnswers(questions: questions))
                        Text(currentCategory.rawValue)
                            .font(.custom("Helvetica Neue", size: 34))
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(Color("BlueCardTextColor"))
                        QuestionCardView(currentPosition: $currentPosition, selectedOptions: $selectedOptions, timeRemaining: $timeRemaining, disabledButton: $disabledButton, guessedRight: $guessedRight, didEnd: $didEnd, questions: questions, question: questions[currentPosition - 1])
                    }
                )
                .onAppear {
                    self.fetchData()
                }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(currentCategory: .naturalDiet)
    }
}
