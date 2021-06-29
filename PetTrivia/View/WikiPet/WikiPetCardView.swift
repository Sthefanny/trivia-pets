//
//  WikiPetCardView.swift
//  PetTrivia
//
//  Created by Naomi Nakanishi on 26/06/21.
//

import SwiftUI

struct WikiPetCardView: View {
    @State var categoryImageName: String?
    @State var categoryTitle: String
    @State var bgColorName: String
    
    let progress: Int
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
            if categoryImageName != nil {
                HStack {
                    Image(categoryImageName!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
            }
            
                Spacer()
                VStack (alignment: .leading){
                  
                    VStack (alignment: .leading) {
                        Spacer()
                        Text(categoryTitle)
                            .font(Font.custom("HelveticaNeue", size: 16))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("BlueCardTextColor"))
                        
                        Text("Acompanhe seu progresso")
                            .font(Font.custom("HelveticaNeue", size: 14))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("ProgressBarBackgroundColor"))
                    }
                    
                    Spacer()
                    
                    VStack (alignment: .center) {
                        WikiPetProgressBarView(progress: CGFloat(progress)/5)
            
                        Text("\(progress) / 5 perguntas acertadas!")
                            .font(Font.custom("HelveticaNeue", size: 14))
                            .foregroundColor(Color("BlueTextColor"))
                    }
                    .padding([.bottom, .top, .trailing])
                    Spacer()

                }
                .padding(.horizontal)
            }

            .background(Color(bgColorName))
            .cornerRadius(10)
            .aspectRatio(8/3, contentMode: .fit)
        }
    }
}


struct WikiPetCardView_Previews: PreviewProvider {
    static var previews: some View {
        WikiPetView()
        WikiPetCardView(categoryImageName: "steakImage", categoryTitle: "Alimentação Natural", bgColorName: "YellowCardColor", progress: Int(2))
    }
}
