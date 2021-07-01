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
        NavigationView {
            VStack {
                Spacer()
                Image(result >= 3 ? "correctDog" : "wrongDog")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
        
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
                    NavigationLink(destination: TabBarView(currentTab: .wiki)
                                    .navigationBarHidden(true)
                                    .navigationBarBackButtonHidden(true))
                    {
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
                }
                .padding([.bottom,.top])
                Button(action: {
                    
                }) {
                    NavigationLink(destination: SortView()
                                    .navigationBarHidden(true)
                                    .navigationBarBackButtonHidden(true))
                    {
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
                }
                .padding(.bottom)
                Button(action: {
                    
                }) {
                    NavigationLink(destination: TabBarView()
                                    .navigationBarHidden(true)
                                    .navigationBarBackButtonHidden(true))
                    {
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
                }
                Spacer()
            }
            .background(Color("BackgroundColor"))
            .ignoresSafeArea(edges: .all)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
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
