//
//  PreGameView.swift
//  PetTrivia
//
//  Created by Naomi Nakanishi on 29/06/21.
//

import SwiftUI

struct PreGameView: View {
    
    @State var isScreenActive: Bool = false
    
    var body: some View {
        VStack{
            Image("preGameImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Spacer()
            Text("Antes de começar...")
                .font(.custom("Helvetica Neue", size: 24))
                .bold()
            
            Text("Após responder as 5 perguntas na categoria selecionada para esse round, aprenda mais na seção WikiPet.")
                .font(.custom("Helvetica Neue", size: 18))
                .bold()
                .padding()
                .multilineTextAlignment(.center)
            Spacer()
            
            Button(action: {
                isScreenActive.toggle()
            }){
                Text("Iniciar Jogo")
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
        .fullScreenCover(isPresented: $isScreenActive, content: {
            SortView()
        })
        .background(
            Image("CountdownBg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
        )
    }
    
}

struct PreGameView_Previews: PreviewProvider {
    static var previews: some View {
        PreGameView()
    }
}
