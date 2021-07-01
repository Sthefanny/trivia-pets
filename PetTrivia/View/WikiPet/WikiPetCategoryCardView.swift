//
//  WikiPetCategoryCardView.swift
//  PetTrivia
//
//  Created by Naomi Nakanishi on 27/06/21.
//

import SwiftUI

struct WikiPetCategoryCardView: View {
    
    @State var bgColorName: String
    
    var question: String
    var note: String
    
    
    var body: some View {
        VStack {
        //Spacer()
            ScrollView{
                VStack (alignment: .leading) {
                    Text(question)
                        .font(Font.custom("HelveticaNeue", size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("BlueCardTextColor"))
                    Spacer()
                    
                    Text(note)
                        .font(Font.custom("HelveticaNeue", size: 17))
                        .foregroundColor(Color("BlueCardTextColor"))
                }               
               
            }
            .padding()
            .padding(.bottom, 20)
                
            .opacity(1)
            Spacer()
        }
        .background(Color(bgColorName).opacity(0.2))
        .cornerRadius(10)
        
    }
    
}

struct WikiPetCategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        WikiPetCategoryCardView(bgColorName: "BlueCardColor", question: "Qual cardápio está correto para alimentar o seu cão?", note: .init(repeating: "a", count: 10000))
    }
}

