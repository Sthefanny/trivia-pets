//
//  MiniCardView.swift
//  PetTrivia
//
//  Created by Sthefanny Gonzaga on 21/06/21.
//

import SwiftUI

struct MiniCardView: View {
    @State var imageName: String
    @State var backgroundImageName: String
    @State var bgColorName: String
    @State var title: String

    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                    HStack {
                        Image(imageName)
                            .resizable()
                            .padding()
                    }
                    .background(background)
                    .clipped()
                }
                .onTapGesture {
                    print("Teste")
                }
            .cornerRadius(10)
            
            Text(title)
                .font(Font.custom("HelveticaNeue", size: 16))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color("BlueCardTextColor"))
                .padding(.bottom, 1)
        }
        
    }
    
    var background: some View {
        ZStack{
            Color(bgColorName)
            Image(backgroundImageName)
                .scaledToFill()
                .layoutPriority(-1)
                .clipped()
            
        }
 
    }
}


struct MiniCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        MiniCardView(imageName: "AccessoryIcon", backgroundImageName: "AcessoriesBgImage", bgColorName: "YellowCardColor", title: "Acessórios")
    }
}

