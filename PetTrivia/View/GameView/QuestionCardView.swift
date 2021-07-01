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
                
                updateCategories()
            }
        }
        return guessedRight
    }
    
    func updateCategories() {
        let actualCategory = UserDefaultsWrapper.fetchActualCategory()
        var possibleCategories = UserDefaultsWrapper.fetchPossibleCategories()
        possibleCategories?.removeAll(where: {$0.id == actualCategory?.id})

        UserDefaultsWrapper.setPossibleCategories(categories: possibleCategories ?? nil)
    }
    
    @Binding var currentPosition: Int
    @Binding var selectedOptions: [Int]
    @Binding var timeRemaining: Int
    @Binding var disableButton: Bool
    @Binding var guessedRight: [Int]
    @Binding var didEnd: Bool
    @State var isCorrect = false
    
    var questions: [QuestionCard]
    var question: QuestionCard
    var body: some View {
        VStack {
            ForEach(question.options) { option in
                
                Button(action: {
                    AudioHelper.playSound(audioName: "button.wav")
                    selectedOptions.append(find(option, question.options))
                    disableButton = true
                    isCorrect = revealAnswer(option: option, question: question)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        currentPosition += 1
                        disableButton = false
                        timeRemaining = 60
                        if selectedOptions.count >= 5 {
                            let dataAvailable = UserDefaultsWrapper.fetchUserInfo()?.guessedRight ?? []
                            let rightAnswers = copyAnswers(selectedOptions: selectedOptions, questions: questions)
                            let userInfo = UserInfo(guessedRight: rightAnswers + dataAvailable)
                            UserDefaultsWrapper.setUserInfo(userInfo: userInfo)
                            guessedRight = dataAvailable
                            didEnd.toggle()
                            
                        }
                    }
                }) {
                    HStack {
                        Text(option.option)
                            .font(.custom("Helvetica Neue", size: 15))
                            .padding()
                        Spacer()
                    }
                    
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.75)
                    .background(Color(disableButton && isSelectedOption(option: option, selectedOption: selectedOptions, question: question) ? (isCorrect ? "CorrectColor" : "WrongColor") : "BackgroundColor"))
                    .cornerRadius(40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.init(red: 83/255, green: 96/255, blue: 132/255), lineWidth: 1)
                    )
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
    @Binding var didEnd: Bool
    var questions: [QuestionCard]
    var question: QuestionCard
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("\(currentPosition).")
                    .font(.custom("Helvetica Neue", size: 30))
                    .bold()
                    .padding([.bottom,.top])
                Text(question.description)
                    .font(.custom("Helvetica Neue", size: 24))
                    .padding(.bottom)
            }
            .frame(maxWidth: UIScreen.main.bounds.width * 0.75)
            
            Spacer()
            OptionView(currentPosition: $currentPosition, selectedOptions: $selectedOptions, timeRemaining: $timeRemaining, disableButton: $disabledButton, guessedRight: $guessedRight, didEnd: $didEnd, questions: questions, question: question)
            Spacer()
        }
        
        .frame(maxHeight: 500)
        .padding()
        .background(Color.white .opacity(0.7))
        .cornerRadius(10)
    }
    
}

struct QuestionCardView_Previews: PreviewProvider {
    static var previews: some View {
    
        QuestionCardView(currentPosition: .constant(1), selectedOptions: .constant([1,1,1,1]), timeRemaining: .constant(60), disabledButton: .constant(false), guessedRight: .constant([]), didEnd: .constant(false), questions: [QuestionCard(
                                                                                                                                                                                                                                    category: .naturalDiet,
                                                                                                                                                                            description: "Esse é um modelo de pergunta teste usado para o Question Bank",
                                                                                                                                                                            options: ["Muito Legal","Legal","Pouco Legal","Nada Legal"],
                                                                                                                                                                                                                                    correctOption: 1, questionId: 1, note:nil)], question: QuestionCard(
                    category: .naturalDiet,
                    description: "Esse é um modelo de pergunta teste usado para o Question Bank",
                    options: ["Muito Legal","Legal","Pouco Legal","Nada Legal"],
                                                                                                                                                                                                                                        correctOption: 1, questionId: 1, note: nil))
    }
}
