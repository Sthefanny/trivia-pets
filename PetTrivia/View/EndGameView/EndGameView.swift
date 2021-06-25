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
            Image(systemName: result >= 3 ? "checkmark.seal.fill" : "xmark.seal.fill")
                .foregroundColor(Color(result >= 3 ? "CorrectColor" : "WrongColor"))
            Text(result >= 3 ? "Mandou bem!" : "Faltou pouco..")
            Text(result >= 3 ? "Você provou que conhece sobre esse assunto, parabéns! Continue progredindo!" : "Você ainda não está pronta(o) para ter um pet, continue estudando e não desista!")
            Text("\(result)/5")
            Button(action: {
                
            }) {
                Text("Quero continuar jogando!")
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                    .background(Color(.red))
            }
            .padding(.bottom)
            Button(action: {
                
            }) {
                Text("Ver progresso")
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                    .background(Color(.red))
            }
        }
    }
}

struct EndGameView_Previews: PreviewProvider {
    static var previews: some View {
        EndGameView(result: 3)
    }
}
