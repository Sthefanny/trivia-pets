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
            Spacer()
            Image("preGameImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .frame(maxHeight: 200)
            Spacer()
            Text("Atenção!")
                .font(.custom("Helvetica Neue", size: 24))
                .bold()
            
            Text("Após o sorteio de categorias, você deverá responder 5 questões, mas terá apenas 1 minuto para cada uma.")
                .font(.custom("Helvetica Neue", size: 18))
                .bold()
                .padding()
                .multilineTextAlignment(.center)
            Spacer()
            
            Button(action: {
                isScreenActive.toggle()
            }){
                Text("Sortear")
                    .font(.custom("Helvetica Neue", size: 20))
                    .foregroundColor(Color("BlueCardTextColor"))
                    .bold()
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 70)
                    .background(Color("YellowCircleColor"))
                    .cornerRadius(15)
                    
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
