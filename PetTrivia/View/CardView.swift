//
//  CardView.swift
//  PetTrivia
//
//  Created by Pablo Penas on 18/06/21.
//

import SwiftUI

struct OptionView: View {
    var question: QuestionCard
    var body: some View {
        VStack {
            ForEach(question.options) { option in
                
                Button(action: {
                    
                }) {
                    
                    HStack {
                        Text(option.option)
                            .font(.custom("Helvetica Neue", size: 20))
                            .padding()
                        Spacer()
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.75)
                    .background(Color.init(red: 249/255, green: 241/255, blue: 232/255))
                    .cornerRadius(40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.init(red: 83/255, green: 96/255, blue: 132/255), lineWidth: 1)
                    )
                }
            }
        }
    }
}


struct CardView: View {
    var question: QuestionCard
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("1.")
                Text(question.description)
            }
            OptionView(question: question)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(question: QuestionCard(
                    category: "Alimentação Natural",
                    description: "Esse é um modelo de pergunta teste usado para o Question Bank",
                    options: ["Muito Legal","Legal","Pouco Legal","Nada Legal"],
                    correctOption: 1))
    }
}
