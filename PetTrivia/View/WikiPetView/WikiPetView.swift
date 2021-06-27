//
//  WikiPetView.swift
//  PetTrivia
//
//  Created by Naomi Nakanishi on 26/06/21.
//

import SwiftUI

struct WikiPetView: View {
    var body: some View {
        ZStack {
            Image("CountdownBg").resizable().edgesIgnoringSafeArea(.all)
            

            VStack{
                
                Image("wikipetTitleImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                
                Spacer()
                WikiPetCardView(categoryImageName: "steakImage", categoryTitle: "Alimentação Natural", bgColorName: "YellowCardColor")
                    .padding(.bottom)
                
                WikiPetCardView(categoryImageName: "bananaImage", categoryTitle: "Comidas Permitidas", bgColorName: "YellowCardColor")
                    .padding(.bottom)

                WikiPetCardView(categoryImageName: "lavanderImage", categoryTitle: "Enriquecimento Ambiental", bgColorName: "YellowCardColor")
                Spacer()
                

            }
            .padding()
         
        }
    }
}

struct WikiPetView_Previews: PreviewProvider {
    static var previews: some View {
        WikiPetView()
    }
}
