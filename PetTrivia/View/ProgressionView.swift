//
//  ProgressionView.swift
//  PetTrivia
//
//  Created by Pablo Penas on 21/06/21.
//

import SwiftUI

struct ProgressionView: View {
    @Binding var currentQuestion: Int
    @Binding var selectedOptions: [Int]
    let correctOptions: [Int]
    var body: some View {
        HStack {
            ForEach((1...5), id: \.self) {
                Circle()
                    .strokeBorder(Color("LightStroke"),lineWidth: 1)
                    .background($0 >= currentQuestion ? Circle().foregroundColor(.white) : Circle().foregroundColor(selectedOptions[$0 - 1] == correctOptions[$0 - 1] ? Color("CorrectColor").opacity(0.5) : Color("WrongColor").opacity(0.5)))
                    .frame(width: 38, height: 38)
                    .overlay(
                            Text("\($0)")
//                                .foregroundColor($0 == currentQuestion ? Color("BlueTextColor") : $0 > currentQuestion ? Color("BlueTextColor").opacity(0.5) : selectedOptions[$0 - 1] == correctOptions[$0 - 1] ? Color("CorrectColor") : Color("WrongColor"))
                                .foregroundColor($0 == currentQuestion ? Color("BlueTextColor") : $0 > currentQuestion ? Color("BlueTextColor").opacity(0.5) : .white)
                        )
                    .padding(10)
            }
        }
    }
}

struct ProgressionView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressionView(currentQuestion: .constant(3), selectedOptions: .constant([1,2,3]), correctOptions: [1,1,1,1,1])
    }
}
