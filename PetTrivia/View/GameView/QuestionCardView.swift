//
//  CardView.swift
//  PetTrivia
//
//  Created by Pablo Penas on 18/06/21.
//

import SwiftUI

struct OptionView: View {
    func find(_ search: Option, _ options: [Option]) -> Int {
        for i in 1...options.count {
            if search.id == options[i - 1].id {
                return i
            }
        }
        return 1
    }
    
    func revealAnswer(option: Option, question: QuestionCard) -> Bool {
        let position = find(option, question.options)
        if position == question.correctOption {
            return true
        } else {
            return false
        }
    }
    
    func isSelectedOption(option: Option, selectedOption: [Int], question: QuestionCard) -> Bool {
        let position = find(option, question.options)
        if position == selectedOptions.last {
            return true
        } else {
            return false
        }
    }
    
    func copyAnswers(selectedOptions: [Int], questions: [QuestionCard]) -> [Int]{
        var guessedRight: [Int] = []
        for i in 0..<selectedOptions.count {
            if selectedOptions[i] == questions[i].correctOption {
                guessedRight.append(questions[i].questionId)
            }
        }
        return guessedRight
    }
    
    @Binding var currentPosition: Int
    @Binding var selectedOptions: [Int]
    @Binding var timeRemaining: Int
    @Binding var disableButton: Bool
    @Binding var guessedRight: [Int]
    @Binding var screenChange: Bool
    @Binding var screenState: ScreenState
    @State var isCorrect = false
    
    var questions: [QuestionCard]
    var question: QuestionCard
    var body: some View {
        VStack {
            ForEach(question.options) { option in
                
                Button(action: {
                    selectedOptions.append(find(option, question.options))
                    disableButton = true
                    isCorrect = revealAnswer(option: option, question: question)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        if selectedOptions.count < 5 {
                            currentPosition += 1
                        }
                        disableButton = false
                        timeRemaining = 60
                        if selectedOptions.count >= 5 {
                            let dataAvailable = UserDefaultsWrapper.fetchUserInfo()?.guessedRight ?? []
                            let rightAnswers = copyAnswers(selectedOptions: selectedOptions, questions: questions)
                            let userInfo = UserInfo(guessedRight: rightAnswers + dataAvailable)
                            UserDefaultsWrapper.setUserInfo(userInfo: userInfo)
                            guessedRight = dataAvailable
                            screenState = .end
                            screenChange.toggle()
                            
                        }
                    }
                }) {
                    HStack {
                        Text(option.option)
                            .layoutPriority(1000)
                            .font(.custom("Helvetica Neue", size: 16))
                            .padding(24)
                            .fixedSize(horizontal: false, vertical: true)
                          
                            
                        Spacer()
                    }
                    
                 
                    .background(Color(disableButton && isSelectedOption(option: option, selectedOption: selectedOptions, question: question) ? (isCorrect ? "CorrectColor" : "WrongColor") : "BackgroundColor"))
                    .cornerRadius(40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.init(red: 83/255, green: 96/255, blue: 132/255), lineWidth: 1)
                    )
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                }
                .disabled(disableButton)
                .foregroundColor(disableButton && isSelectedOption(option: option, selectedOption: selectedOptions, question: question) ? .white : .black)
            }
        }
    }
}


struct QuestionCardView: View {
    @Binding var currentPosition: Int
    @Binding var selectedOptions: [Int]
    @Binding var timeRemaining: Int
    @Binding var disabledButton: Bool
    @Binding var guessedRight: [Int]
    @Binding var screenChange: Bool
    @Binding var screenState: ScreenState
    var questions: [QuestionCard]
    var question: QuestionCard
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
//
                Text(question.description)
                    .font(.custom("Helvetica Neue", size: 24))
                    .bold()
                    .padding(.vertical)
                    //.padding()
             
            }

            
            Spacer()
            OptionView(currentPosition: $currentPosition, selectedOptions: $selectedOptions, timeRemaining: $timeRemaining, disableButton: $disabledButton, guessedRight: $guessedRight, screenChange: $screenChange, screenState: $screenState, questions: questions, question: question)
            Spacer()
        }
        
        .background(Color.white .opacity(0.8))
        .cornerRadius(15)
        .padding()
        
    }
    
    
}

struct QuestionCardView_Previews: PreviewProvider {
    static var previews: some View {
    
        QuestionCardView(currentPosition: .constant(1), selectedOptions: .constant([1,1,1,1]), timeRemaining: .constant(60), disabledButton: .constant(false), guessedRight: .constant([]),screenChange: .constant(true), screenState: .constant(.end), questions: [QuestionCard(
                                                                                                                                                                                                                                    category: .naturalDiet,
                                                                                                                                                                            description: "Esse é um modelo de pergunta teste usado para o Question Bank",
                                                                                                                                                                            options: ["Muito Legal","Legal","Pouco Legal","Nada Legal"],
                                                                                                                                                                                                                                    correctOption: 1, questionId: 1, note:nil)], question: QuestionCard(
                    category: .naturalDiet,
                    description: "Esse é um modelo de pergunta teste usado para o Question Bank",
                    options: ["Muito Legaaaaaaaaaaaaaaaaaaaaaaaall dude","Legal","Pouco Legal","Nada Legal"],
                                                                                                                                                                                                                                        correctOption: 1, questionId: 1, note: nil))
    }
}
