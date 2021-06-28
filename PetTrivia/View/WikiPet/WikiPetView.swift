//
//  WikiPetView.swift
//  PetTrivia
//
//  Created by Naomi Nakanishi on 26/06/21.
//

import SwiftUI

struct WikiPetView: View {
    
  //  @State var correctAnswers: [QuestionCard]
    
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
                            destination: WikiPetCategoryView(
                                category: "Alimentação Natural",
                                categoryImageName: "steakCategoryImage",
                                question: "O que é alimentação natural para cães?",
                                categoryQuestions: QuestionBank.instance.questionFilter(category: .naturalDiet, guessedRight: UserDefaultsWrapper.fetchUserInfo()?.guessedRight ?? [])
                            ),
                            label: {
                                WikiPetCardView(categoryImageName: "steakImage", categoryTitle: QuestionCategory.naturalDiet.rawValue, bgColorName: "YellowCardColor", progress: loadCorrectAnswers(.naturalDiet))
                            })
                            .padding(.bottom)
                        
                        NavigationLink(
                            destination: WikiPetCategoryView(category: "Comidas Permitidas", categoryImageName: "bananaCategoryImage", question: "O que é alimentação natural para cães?", categoryQuestions:  QuestionBank.instance.questionFilter(category: .allowedFood, guessedRight: UserDefaultsWrapper.fetchUserInfo()?.guessedRight ?? [])),
                            label: {
                                WikiPetCardView(categoryImageName: "bananaImage", categoryTitle: QuestionCategory.allowedFood.rawValue, bgColorName: "YellowCardColor", progress: loadCorrectAnswers(.allowedFood))
                            })
                            .padding(.bottom)
                        
                        NavigationLink(
                            destination: WikiPetCategoryView(category: "Enriquecimento Ambiental", categoryImageName: "lavanderCategoryImage", question: "O que é alimentação natural para cães?", categoryQuestions:  QuestionBank.instance.questionFilter(category: .environmentalEnrichment, guessedRight: UserDefaultsWrapper.fetchUserInfo()?.guessedRight ?? [])),
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
