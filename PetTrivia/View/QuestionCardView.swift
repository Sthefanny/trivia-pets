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
    @Binding var currentPosition: Int
    @Binding var selectedOptions: [Int]
    var question: QuestionCard
    var body: some View {
        VStack {
            ForEach(question.options) { option in
                
                Button(action: {
                    selectedOptions.append(find(option, question.options))
                    currentPosition += 1
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
                .foregroundColor(.black)
            }
        }
    }
}


struct QuestionCardView: View {
    @Binding var currentPosition: Int
    @Binding var selectedOptions: [Int]
    var question: QuestionCard
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("\(currentPosition).")
                    .font(.custom("Helvetica Neue", size: 30))
                    .padding([.bottom,.top])
                Text(question.description)
                    .font(.custom("Helvetica Neue", size: 24))
                    .padding(.bottom)
            }
            .frame(maxWidth: UIScreen.main.bounds.width * 0.75)
            Spacer()
            OptionView(currentPosition: $currentPosition, selectedOptions: $selectedOptions, question: question)
        }
        .frame(maxHeight: 500)
        .padding()
        .background(Color.white)
        .cornerRadius(24)
    }
}

struct QuestionCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCardView(currentPosition: .constant(1), selectedOptions: .constant([1,1,1,1]), question: QuestionCard(
                    category: "Alimentação Natural",
                    description: "Esse é um modelo de pergunta teste usado para o Question Bank",
                    options: ["Muito Legal","Legal","Pouco Legal","Nada Legal"],
                    correctOption: 1))
    }
}
