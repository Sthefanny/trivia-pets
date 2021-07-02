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
            .padding([.horizontal])
            .padding(.top, -30)
        }
    }
}

struct WikiPetCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WikiPetCategoryView(category: "Alimentação Natural", categoryImageName: "steakCategoryImage", question: "O que é alimentação natural para cães?", categoryQuestions: [QuestionCard(
                                                                                                                                                                                            category: .naturalDiet,
                                                                                                                                                                                            description: "O que NÃO melhora as habilidades sociais do seu cachorro?",
                                                                                                                                                                                            options: ["Purê de batata com cebola refogada.","Frango cozido desfiado, sem tempero nenhum.","Frutas, como laranja, uva ou abacaxi, cortada em cubos. ","Ovo frito e arroz integral."], correctOption: 1, questionId: 1,
                                                                                                                                                                                            note: "É muito importante integrar o cachorro em outros ambientes, como na natureza, e em contato com outros animais (inclusive de outras espécies) e pessoas. \n\nEsse é um estímulo que somente pode ser feito com supervisão do dono, seja em parques e praças, enquanto caminham, ou até mesmo ao receber visitas em casa.\nSoltar o cão na rua ou próximo a ela sem qguia pode ser muito perigoso para o pet, devido aos diferentes estímulos que ele vai encontrar. Como não podemos controlar a movimentação de pessoas, outros animais e até mesmo veículos, para evitar acidentes, o ideal é sempre fazer uso da guia, nos passeios com o pet, e nunca deixá-lo desacompanhado em locais públicos. \n\nSe você não tem certeza de como começar a socializar seu pet, uma opção é levar em locais especializados, como as creches e hotéis caninos, pois já são preparadas para esse tipo de situação.")])
        }
    }
}

