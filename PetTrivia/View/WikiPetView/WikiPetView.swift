//
//  WikiPetView.swift
//  PetTrivia
//
//  Created by Naomi Nakanishi on 26/06/21.
//

import SwiftUI

struct WikiPetView: View {
    
  //  @State var correctAnswers: [QuestionCard]
    
    func loadCorrectAnswers(_ category: String) -> Int {
        let allQuestions = QuestionBank.instance.questionList
        let rightIDs = UserDefaultsWrapper.fetchUserInfo()?.guessedRight ?? []
        let rightQuestions = allQuestions.filter {
            rightIDs.contains($0.questionId) &&
                $0.category == category
        }
        return (rightQuestions.count)
    }
    
    var body: some View {
        ZStack {
            Image("CountdownBg").resizable().edgesIgnoringSafeArea(.all)
            

            VStack{
                Image("wikipetTitleImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Text("WikiPet ")
                    .font(Font.custom("HelveticaNeue", size: 40))
                    .fontWeight(.medium)
                    .foregroundColor(Color("BlueTextColor"))

                Spacer()
               
                WikiPetCardView(categoryImageName: "steakImage", categoryTitle: "Alimentação Natural", bgColorName: "YellowCardColor", progress: loadCorrectAnswers("Alimentação Natural"))
                    .padding(.bottom)
                
                WikiPetCardView(categoryImageName: "bananaImage", categoryTitle: "Comidas Permitidas", bgColorName: "YellowCardColor", progress: loadCorrectAnswers("Comidas Permitidas"))
                    .padding(.bottom)

                WikiPetCardView(categoryImageName: "lavanderImage", categoryTitle: "Enriquecimento Ambiental", bgColorName: "YellowCardColor", progress: loadCorrectAnswers("Enriquecimento Ambiental"))
                    .padding(.bottom)
                Spacer()
                

            }
            .padding()
         
        }
    }
}

struct WikiPetView_Previews: PreviewProvider {
    static var previews: some View {
      // Text("a culpa é do pastre")
         WikiPetView()
    }
}
