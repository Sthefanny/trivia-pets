//
//  ProgressionView.swift
//  PetTrivia
//
//  Created by Pablo Penas on 21/06/21.
//

import SwiftUI

struct ProgressionView: View {
    @State var currentQuestion: Int
    var body: some View {
        HStack {
            ForEach((1...5), id: \.self) {
                Circle()
                    .strokeBorder(Color("LightStroke"),lineWidth: 1)
                    .background(Circle().foregroundColor(.white))
                    .frame(width: 38, height: 38)
                    .overlay(
                            Text("\($0)")
                                .foregroundColor($0 == currentQuestion ? Color("BlueTextColor") : $0 > currentQuestion ? Color("BlueTextColor").opacity(0.5) : .red)
                        )
                    .padding(10)
            }
        }
    }
}

struct ProgressionView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressionView(currentQuestion: 3)
    }
}
