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
                Image(categoryImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 150)
                VStack (alignment: .leading) {
                    Text(category)
                        .font(Font.custom("HelveticaNeue", size: 35))
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
            .padding()
        }
    
    }
}

struct WikiPetCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        WikiPetCategoryView(category: "Alimentação Natural", categoryImageName: "steakCategoryImage", question: "O que é alimentação natural para cães?", categoryQuestions: [QuestionCard(
                                                                                                                                                                                        category: .naturalDiet,
                                                                                                                                                                                        description: "O que NÃO melhora as habilidades sociais do seu cachorro?",
                                                                                                                                                                                        options: ["Purê de batata com cebola refogada.","Frango cozido desfiado, sem tempero nenhum.","Frutas, como laranja, uva ou abacaxi, cortada em cubos. ","Ovo frito e arroz integral."], correctOption: 1, questionId: 1,
                                                                                                                                                                                        note: "É de extrema relevância a integração do seu cachorro em outros ambientes, como na natureza, e em contato com outros animais (inclusive de outras espécies) e pessoas. Esse é um estímulo que somente pode ser feito com supervisão do dono, seja em parques e praças, enquanto caminham, ou até mesmo quando você recebe visitas em casa. Locais especializados, como as creches e hotéis caninos, também oferecem um excelente espaço de socialização e interação com seu pet. Em contrapartida, soltar o cãozinho sem guia, na rua, considerando os diferentes estímulos que ele vai encontrar, seja pessoas, outros animais, carros, barulhos, aromas e etc., pode ser extremamente perigoso e expositivo para seu animal. A fim de evitar acidentes letais e transtornos, o ideal é sempre fazer uso da guia, nos passeios com o pet, e nunca deixá-lo desacompanhado em locais públicos.")])
    }
}
