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
    var categoryQuestions: [QuestionCard]
        
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
                                                                                                                                                                                        description: "Qual cardápio está correto para alimentar o seu cão?",
                                                                                                                                                                                        options: ["Purê de batata com cebola refogada.","Frango cozido desfiado, sem tempero nenhum.","Frutas, como laranja, uva ou abacaxi, cortada em cubos. ","Ovo frito e arroz integral."], correctOption: 1, questionId: 1,
                                                                                                                                                                                        note: "O cardápio que oferecemos para nossos pets na alimentação natural deve ser planejado por nutricionistas especializados nesse tipo de dieta. No entanto, alguns alimentos não são permitidos de maneira geral, como:\nCebola: tanto crua quanto cozida, contém uma toxina que pode oxidar os glóbulos vermelhos do cachorro, reduzindo a capacidade de transportar oxigênio. Isso pode resultar em uma doença chamada anemia hemolítica, que pode vir a ser fatal.\nFrutas ácidas, como laranja, uva ou abacaxi, pois podem causar gastrite;\nFrituras, e até mesmo gorduras em geral podem causar pancreatite nos cães.")])
    }
}
