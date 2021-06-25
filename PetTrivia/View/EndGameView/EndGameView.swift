//
//  EndGameView.swift
//  PetTrivia
//
//  Created by Pablo Penas on 25/06/21.
//

import SwiftUI

struct EndGameView: View {
    var result: Int
    
    var body: some View {
        VStack {
            Spacer()
            Image(result >= 3 ? "correctDog" : "wrongDog")
    
            Text(result >= 3 ? "Parabéns!" : "Que pena!")
                .font(.custom("Helvetica Neue", size: 24))
                .bold()
            Text("\(result)/5")
                .font(.custom("Helvetica Neue", size: 32))
                .bold()
                .foregroundColor(Color(result >= 3 ? "CorrectColor" : "WrongColor"))
                .padding(.top)
            Text(result >= 3 ? "Você sabe muito do assunto, mas que tal dar uma olhada na nossa Wikipet para aprender um pouco mais?" : "Parece que você precisa aprender um pouco mais... não desanime e use nossa Wikipet para aprender um pouco mais!")
                .font(.custom("Helvetica Neue", size: 18))
                .bold()
                .padding()
                .multilineTextAlignment(.center)
            Button(action: {
//                    NavigationLink(destination: )
            }) {
                Text("Wikipet")
                    .foregroundColor(Color("BlueCardTextColor"))
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                    .background(Color(.white))
                    .cornerRadius(38)
                    .overlay(
                        RoundedRectangle(cornerRadius: 38)
                            .stroke(Color("StrokeBege"))
                    )
            }
            .padding([.bottom,.top])
            Button(action: {
                
            }) {
                Text("Continuar jogando")
                    .foregroundColor(Color("BlueCardTextColor"))
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                    .background(Color(.white))
                    .cornerRadius(38)
                    .overlay(
                        RoundedRectangle(cornerRadius: 38)
                            .stroke(Color("StrokeBege"))
                    )
            }
            .padding(.bottom)
            Button(action: {
                
            }) {
                Text("Menu Principal")
                    .foregroundColor(Color("BlueCardTextColor"))
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                    .background(Color(.white))
                    .cornerRadius(38)
                    .overlay(
                        RoundedRectangle(cornerRadius: 38)
                            .stroke(Color("StrokeBege"))
                    )
            }
            Spacer()
        }
        .ignoresSafeArea(edges: .all)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color("BackgroundColor"))
    }
}

struct EndGameView_Previews: PreviewProvider {
    static var previews: some View {
        EndGameView(result: 5)
    }
}
