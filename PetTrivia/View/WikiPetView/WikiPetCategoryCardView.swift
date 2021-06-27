//
//  WikiPetCategoryCardView.swift
//  PetTrivia
//
//  Created by Naomi Nakanishi on 27/06/21.
//

import SwiftUI

struct WikiPetCategoryCardView: View {
    
    @State var bgColorName: String
    
    var body: some View {
        VStack{
        //Spacer()
           Text("A alimentação natural é uma dieta balanceada, composta por ingredientes naturais e minimamente processados que são preparados de forma caseira para suprir todas as necessidades do cão.")
                .padding()
                .font(Font.custom("HelveticaNeue", size: 17))
                //.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color("BlueCardTextColor"))
           // Spacer()
        }
        .background(Color(bgColorName))
        .opacity(0.6)
        .cornerRadius(10)
        
    }
    
}

struct WikiPetCategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        WikiPetCategoryCardView(bgColorName: "BlueCardColor")
    }
}

