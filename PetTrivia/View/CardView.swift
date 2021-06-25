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

    
    var body: some View {
        ZStack {
            if imageName != nil {
                HStack {
                    Spacer()
                    Image(imageName!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
               // .padding(.trailing, 0)
              //  .padding(.top, -16)
            }
            VStack {
                Spacer()
                HStack {
                    Text(title)
                        .font(Font.custom("HelveticaNeue", size: 16))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("BlueCardTextColor"))
                 //       .layoutPriority(1000)
                        .padding()
                    Spacer()

                }
            }
                

            //.padding([.horizontal, .bottom])
        }
        .background(Color(bgColorName))
        .cornerRadius(10)
        .aspectRatio(contentMode: .fit)
        .onTapGesture {
            print("Teste")
        }


    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        CardView(imageName: "playCardImage", title: "Jogar",  bgColorName: "BlueCardColor")
    }
}
