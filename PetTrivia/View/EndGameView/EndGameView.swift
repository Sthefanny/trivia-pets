//
//  EndGameView.swift
//  PetTrivia
//
//  Created by Pablo Penas on 25/06/21.
//

import SwiftUI

struct EndGameView: View {
    @State private var isScreenActive = false
    static var navigate = 0
    var result: Int
    
    var body: some View {
        VStack {
            Spacer()
            Image(result >= 3 ? "correctDog" : "wrongDog")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 250)
            Text("\(result)/5")
                .font(.custom("Helvetica Neue", size: 32))
                .bold()
                .foregroundColor(Color(result >= 3 ? "CorrectColor" : "WrongColor"))
                
            Text(result >= 3 ? "Parabéns!" : "Que pena!")
                .font(.custom("Helvetica Neue", size: 24))
                .bold()
                .padding(.top)
            
            Text(result >= 3 ? "Você sabe muito do assunto, mas que tal dar uma olhada na nossa Wikipet para aprender um pouco mais? :)" : "Que pena!\nParece que você ainda não domina esse assunto... mas não desanime! Use a Wikipet para aprender um pouco mais! :)")
                .font(.custom("Helvetica Neue", size: 18))
                .bold()
                .padding()
                .multilineTextAlignment(.center)
            Button(action: {
                EndGameView.navigate = 1
                AudioHelper.playSound(audioName: "button.wav")
                isScreenActive.toggle()
            }) {
                Text("Ir para WikiPet")
                    .bold()
                    .foregroundColor(Color("BlueCardTextColor"))
                    .frame(width: UIScreen.main.bounds.width * 0.85, height: 60)
                    .background(Color("YellowCircleColor"))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("StrokeBege"))
                    )
            
            }
            .padding([.bottom])
            
            Button(action: {
                EndGameView.navigate = 2
                AudioHelper.playSound(audioName: "button.wav")
                isScreenActive.toggle()
            }) {
                Text("Jogar Novamente")
                    .foregroundColor(Color("BlueCardTextColor"))
                    .frame(width: UIScreen.main.bounds.width * 0.85, height: 60)
                    .background(Color(.white))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("StrokeBege"))
                    )
            }
            .padding(.bottom, 4)
            Button(action: {
                EndGameView.navigate = 3
                AudioHelper.playSound(audioName: "button.wav")
                isScreenActive.toggle()
            }) {
                Text("Menu Principal")
                    .foregroundColor(Color("BlueCardTextColor"))
                    .frame(width: UIScreen.main.bounds.width * 0.85, height: 60)
                    .background(Color(.white))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("StrokeBege"))
                    )
            }
            Spacer()
        }
        .fullScreenCover(isPresented: $isScreenActive, content: {
            switch EndGameView.navigate {
            case 1:
                TabBarView(currentTab: .wiki)
            case 2:
                SortView()
            case 3:
                TabBarView()
            default: EndGameView(result: result)
            }
        })
        .background(Color("BackgroundColor"))
        .ignoresSafeArea(edges: .all)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .onAppear {
            AudioHelper.playSound(audioName: result >= 3 ? "answerWin.wav" : "answerLose.wav")
        }
    }

}

struct EndGameView_Previews: PreviewProvider {
    static var previews: some View {
        EndGameView(result: 5)
    }
}
