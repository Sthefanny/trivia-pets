//
//  WikiPetCategoryView.swift
//  PetTrivia
//
//  Created by Naomi Nakanishi on 27/06/21.
//

import SwiftUI

struct WikiPetCategoryView: View {
    
    @State var category: String
    @State var categoryImageName: String
    @State var question: String
        
    var body: some View {
        ZStack {
            Image("CountdownBg").resizable().edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(categoryImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack (alignment: .leading) {
                    Text(category)
                        .font(Font.custom("HelveticaNeue", size: 35))
                        .fontWeight(.medium)
                        .foregroundColor(Color("BlueTextColor"))
                    Text(question)
                        .font(Font.custom("HelveticaNeue", size: 24))
                        .fontWeight(.thin)
                        .foregroundColor(Color("BlueTextColor"))
                }
                
             //   Spacer()
                
                WikiPetCategoryCardView(bgColorName: "BlueCardColor")
                
                Spacer()
            }
            .padding()
        }
    
    }
}

struct WikiPetCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        WikiPetCategoryView(category: "Alimentação Natural", categoryImageName: "steakCategoryImage", question: "O que é alimentação natural para cães?")
    }
}
