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
    @State var bgColorName: String
    
    var isEnabled: Bool = true
    
    var body: some View {
        VStack (alignment: .leading){
            ZStack {
                if imageName != nil {
                    HStack {
                        Spacer()
                        Image(imageName!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }

                }
                VStack {
                    Spacer()
                    HStack {
                        Text(title)
                            .font(Font.custom("HelveticaNeue", size: 16))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("BlueCardTextColor"))
                            .padding()
                        Spacer()

                    }
                }

            }
                .background(Color(bgColorName))
                .cornerRadius(10)
                .aspectRatio(contentMode: .fit)
            
            .opacity(isEnabled ? 1 : 0.2)
            if !isEnabled {
                    Text("Disponível em breve")
                        .font(Font.custom("HelveticaNeue", size: 12))
                        .foregroundColor(.gray)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        CardView(imageName: "playCardImage", title: "Jogar",  bgColorName: "BlueCardColor")
    }
}
