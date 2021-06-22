//
//  MiniCardView.swift
//  PetTrivia
//
//  Created by Sthefanny Gonzaga on 21/06/21.
//

import SwiftUI

struct MiniCardView: View {
    @State var imageName: String
    @State var bgColorName: String
    @State var title: String

    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                    HStack {
                        Spacer()
                        Image(imageName)
                    }
                    .padding()
                }
                .background(Color(bgColorName))
                .cornerRadius(10)
                .onTapGesture {
                    print("Teste")
                }
            
            Text(title)
                .font(Font.custom("HelveticaNeue", size: 16))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color("BlueCardTextColor"))
                .padding(.bottom, 1)
        }
        .padding(5)
    }
}

struct MiniCardView_Previews: PreviewProvider {
    static var previews: some View {
        MiniCardView(imageName: "AccessoryIcon", bgColorName: "YellowCardColor", title: "Acessórios")
    }
}
