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
            
            Spacer()
            
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(title)
                        .font(Font.custom("HelveticaNeue", size: 20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .lineLimit(2)
                        .foregroundColor(Color("BlueCardTextColor"))
                        .layoutPriority(1000)
                       // .padding(.bottom, 1)
                    Spacer()
                    Text(subtitle)
                        .font(Font.custom("HelveticaNeue", size: 13))
                        .fontWeight(.medium)
                        .foregroundColor(Color("WhiteCardTextColor"))
                    Spacer()
                }
                .layoutPriority(100)
 
             //   Spacer()
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
     //   .aspectRatio(3/4, contentMode: .fit)

    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        CardView(imageName: "AchievementIcon", title: "Suas conquistas", subtitle: "Biblioteca das informações conquistadas no jogo", bgColorName: "BlueCardColor")
    }
}
