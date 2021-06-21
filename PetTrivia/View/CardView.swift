//
//  CardView.swift
//  PetTrivia
//
//  Created by Sthefanny Gonzaga on 21/06/21.
//

import SwiftUI

struct CardView: View {
    @State var imageName: String?
    @State var title: String
    @State var subtitle: String
    @State var bgColorName: String

    
    var body: some View {
            VStack {
                if imageName != nil {
                    HStack {
                        Spacer()
                        Image(imageName!)
                    }
                    .padding(.trailing, 0)
                    .padding(.top, -16)
                }

                HStack {
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(Font.custom("HelveticaNeue", size: 16))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("BlueCardTextColor"))
                            .padding(.bottom, 1)
                        Text(subtitle)
                            .font(Font.custom("HelveticaNeue", size: 11))
                            .fontWeight(.medium)
                            .foregroundColor(Color("WhiteCardTextColor"))
                    }
                    .layoutPriority(100)
     
                    Spacer()
                }
                .padding([.horizontal, .bottom])
            }
            .padding([.top])
            .background(Color(bgColorName))
            .cornerRadius(10)
            .onTapGesture {
                print("Teste")
            }
            .padding(5)
        }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(imageName: "AchievementIcon", title: "Suas conquistas", subtitle: "Biblioteca das informações conquistadas no jogo", bgColorName: "BlueCardColor")
    }
}
