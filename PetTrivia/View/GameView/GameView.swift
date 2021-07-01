//
//  GameView.swift
//  PetTrivia
//
//  Created by Pablo Penas on 18/06/21.
//

import SwiftUI

enum ScreenState {
    case back
    case end
    case none
}

struct GameView: View {
    @State var timeRemaining = 60
    @State var currentPosition = 1
    @State var selectedOptions: [Int] = []
    @State var disabledButton = false
    @State var guessedRight: [Int] = []
    
    
    @State var questions: [QuestionCard] = []
    @State var correctAnswers: [Int] = []
    @State var isLoaded = false
    
    @State var screenChange = false
    @State var backActive = false
    
    
    @State public var screenState: ScreenState = .none
    

    var currentCategory: QuestionCategory
    
    func fetchData() {
        let data = UserDefaultsWrapper.fetchUserInfo()?.guessedRight ?? []
        self.guessedRight = data
        self.questions = QuestionBank.instance.questionFilter(category: currentCategory, guessedRight: guessedRight)
        self.getCorrectAnswers()
        isLoaded = true
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
    
    func getCorrectAnswers() {
        for i in 0..<5 {
            self.correctAnswers.append(self.questions[i].correctOption)
        }
    }
    
    func fullScreenGameView(view: AnyView) -> some View {
        Group {
            switch screenState {
            case .end:
                view.fullScreenCover(isPresented: $screenChange, content: {
                    EndGameView(result: checkAnswers(selectedOptions: selectedOptions, questions: questions))
                })
            case .back:
                view.fullScreenCover(isPresented: $screenChange) {
                    TabBarView()
                }
            case .none:
                view.fullScreenCover(isPresented: $screenChange) {EmptyView()}
            }
        }
    }
    
    var body: some View {
        fullScreenGameView(view: AnyView(content))
            .onAppear {
                self.fetchData()
            }
    }
    
    
    
    var content: some View {
        VStack {
            if isLoaded {
                Image("GameBackground")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .ignoresSafeArea(edges: .all)
                    .overlay(
                        VStack {
                            TimerView(timeRemaining: $timeRemaining, disabledButton: $disabledButton, selectedOptions: $selectedOptions, currentPosition: $currentPosition, screenChange: $screenChange, backActive: $backActive, screenState: $screenState)
                                .padding()
                            ProgressionView(currentQuestion: $currentPosition, selectedOptions: $selectedOptions, correctOptions: self.correctAnswers)
                            Text(questions[currentPosition - 1].category.rawValue)
                                .font(.custom("Helvetica Neue", size: 34))
                                .fontWeight(.bold)
                                .padding()
                                .foregroundColor(Color("BlueCardTextColor"))
                            QuestionCardView(currentPosition: $currentPosition,
                                             selectedOptions: $selectedOptions,
                                             timeRemaining: $timeRemaining,
                                             disabledButton: $disabledButton,
                                             guessedRight: $guessedRight,
                                             screenChange: $screenChange,
                                             screenState: $screenState,
                                             questions: questions,
                                             question: questions[currentPosition - 1])
                                .padding(5)
                                
                        }
                    )
            } else {
                ProgressView()
            }
        }
//        .fullScreenCover(isPresented: $screenChange, content:
//                            {TabBarView()}
//        {
//            if self.screenState == "end" {
//                EndGameView(result: checkAnswers(selectedOptions: selectedOptions, questions: questions))
//            } else if backActive {
//                TabBarView()
//            } else {
//                Text("BUGADO")
//            }
//        }
//        )
//        .onAppear {
//            self.fetchData()
//        }
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(screenState: .end, currentCategory: .naturalDiet)
    }
}

