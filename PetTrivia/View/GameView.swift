//
//  GameView.swift
//  PetTrivia
//
//  Created by Pablo Penas on 18/06/21.
//

import SwiftUI

struct GameView: View {
    let questions = QuestionBank.instance.questionList
    var body: some View {
        Color("BackgroundColor")
            .ignoresSafeArea(edges: .all)
            .overlay(
                VStack {
                    Text(questions[0].category)
                        .font(.custom("Helvetica Neue", size: 34))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(Color("BlueTextColor"))
                    CardView(question: questions[0])
                }
            )
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
