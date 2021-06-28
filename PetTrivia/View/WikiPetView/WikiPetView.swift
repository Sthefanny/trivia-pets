//
//  WikiPetView.swift
//  PetTrivia
//
//  Created by Naomi Nakanishi on 26/06/21.
//

import SwiftUI

struct WikiPetView: View {
    
  //  @State var correctAnswers: [QuestionCard]
    let test: [QuestionCard] = [QuestionCard(
                                    category: .naturalDiet,
                                    description: "Qual cardápio está correto para alimentar o seu cão?",
                                    options: ["Purê de batata com cebola refogada.","Frango cozido desfiado, sem tempero nenhum.","Frutas, como laranja, uva ou abacaxi, cortada em cubos. ","Ovo frito e arroz integral."], correctOption: 1, questionId: 1,
                                    note: "O cardápio que oferecemos para nossos pets na alimentação natural deve ser planejado por nutricionistas especializados nesse tipo de dieta. No entanto, alguns alimentos não são permitidos de maneira geral, como:\nCebola: tanto crua quanto cozida, contém uma toxina que pode oxidar os glóbulos vermelhos do cachorro, reduzindo a capacidade de transportar oxigênio. Isso pode resultar em uma doença chamada anemia hemolítica, que pode vir a ser fatal.\nFrutas ácidas, como laranja, uva ou abacaxi, pois podem causar gastrite;\nFrituras, e até mesmo gorduras em geral podem causar pancreatite nos cães.")]
    func loadCorrectAnswers(_ category: QuestionCategory) -> Int {
        let allQuestions = QuestionBank.instance.questionList
        let rightIDs = UserDefaultsWrapper.fetchUserInfo()?.guessedRight ?? []
        let rightQuestions = allQuestions.filter {
            rightIDs.contains($0.questionId) &&
                $0.category == category
        }
        
       
        return (rightQuestions.count)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("CountdownBg")
                    .resizable()
                
                ScrollView {
                    VStack {
                        Image("wikipetTitleImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Spacer()
                        Text("WikiPet")
                            .font(Font.custom("HelveticaNeue", size: 40))
                            .fontWeight(.medium)
                            .foregroundColor(Color("BlueTextColor"))

                        Spacer()
                  
                        NavigationLink(
                            destination: WikiPetCategoryView(category: "Alimentação Natural", categoryImageName: "steakCategoryImage", question: "O que é alimentação natural para cães?", categoryQuestions: test),
                            label: {
                                WikiPetCardView(categoryImageName: "steakImage", categoryTitle: QuestionCategory.naturalDiet.rawValue, bgColorName: "YellowCardColor", progress: loadCorrectAnswers(.naturalDiet))
                            })
                            .padding(.bottom)
                        
                        NavigationLink(
                            destination: WikiPetCategoryView(category: "Comidas Permitidas", categoryImageName: "bananaCategoryImage", question: "O que é alimentação natural para cães?", categoryQuestions: test),
                            label: {
                                WikiPetCardView(categoryImageName: "bananaImage", categoryTitle: QuestionCategory.allowedFood.rawValue, bgColorName: "YellowCardColor", progress: loadCorrectAnswers(.allowedFood))
                            })
                            .padding(.bottom)
                        
                        NavigationLink(
                            destination: WikiPetCategoryView(category: "Enriquecimento Ambiental", categoryImageName: "lavanderCategoryImage", question: "O que é alimentação natural para cães?", categoryQuestions: test),
                            label: {
                                WikiPetCardView(categoryImageName: "lavanderImage", categoryTitle: QuestionCategory.environmentalEnrichment.rawValue, bgColorName: "YellowCardColor", progress: loadCorrectAnswers(.environmentalEnrichment))

                            })
                    }
                    .padding()
                }
            }
            .padding(.top, 32)
            .edgesIgnoringSafeArea([.top, .horizontal])
        }
    }
}

struct WikiPetView_Previews: PreviewProvider {
    static var previews: some View {
      // Text("a culpa é do pastre")
         WikiPetView()
    }
}
