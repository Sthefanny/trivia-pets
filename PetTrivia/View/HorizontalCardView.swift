//
//  HorizontalCardView.swift
//  PetTrivia
//
//  Created by Naomi Nakanishi on 21/06/21.
//

import SwiftUI

struct HorizontalCardView: View {
    @State var imageName: String?
    @State var title: String
    @State var subtitle: String
    @State var bgColorName: String

    
    var body: some View {
            ZStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(Font.custom("HelveticaNeue", size: 20))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("BlueCardTextColor"))
                            .padding(.bottom, 1)
                        Text(subtitle)
                            .font(Font.custom("HelveticaNeue", size: 13))
                            .fontWeight(.medium)
                            .foregroundColor(Color("WhiteCardTextColor"))
                    }
                    .layoutPriority(100)
     
                    Spacer()
                }
                .padding(20)
            }
            .padding([.top])
            .background(background)
            .cornerRadius(10)
            .onTapGesture {
                print("Teste")
            }
            .padding(5)
        }
    
    var background: some View{
        ZStack{
            Color(bgColorName)
            Image(imageName!)
                .resizable()
                .scaledToFill()
                .layoutPriority(-1)
                .clipped()
            
        }
    }
}

struct HorizontalCardView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCardView(imageName: "estudos-bg-teste", title: "Suas conquistas", subtitle: "Biblioteca das informações conquistadas no jogo", bgColorName: "BlueCardColor")
    }
}

