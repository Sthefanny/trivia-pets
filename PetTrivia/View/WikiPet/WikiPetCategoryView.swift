//
//  WikiPetCategoryView.swift
//  PetTrivia
//
//  Created by Naomi Nakanishi on 27/06/21.
//

import SwiftUI
import Foundation

struct WikiPetCategoryView: View {
    
    @State var category: String
    @State var categoryImageName: String
    @State var question: String
    var categoryQuestions: [QuestionCard]
        
    var body: some View {
        ZStack {
            Image("CountdownBg").resizable().edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Image(categoryImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 100)
                    Text(category)
                        .font(Font.custom("HelveticaNeue", size: 30))
                        .fontWeight(.medium)
                        .foregroundColor(Color("BlueTextColor"))
                      
                }
                .padding(.bottom)
                Spacer()
                  
                if categoryQuestions.isEmpty{
                    WikiPetCategoryCardView(bgColorName: "BlueCardColor", question: "Ops!", note: "Parece que ainda não temos nenhum conteúdo por aqui. \nJogue uma rodada dentro dessa categoria para acessar mais informações :)")
                    
                } else {
                
                    TabView{
                        ForEach(categoryQuestions.filter {
                            $0.note != nil
                        }, id: \.questionId){
                            question in
                            WikiPetCategoryCardView(bgColorName: "BlueCardColor", question: question.description, note: question.note!)
                        }
                        
                    }
                    .tabViewStyle(PageTabViewStyle())
                    Spacer()
                }
            }
            .padding([.horizontal])
            .padding(.top, -30)
        }
    }
}

struct WikiPetCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WikiPetCategoryView(category: "Alimentação Natural", categoryImageName: "steakCategoryImage", question: "O que é alimentação natural para cães?", categoryQuestions: [])
        }
    }
}
