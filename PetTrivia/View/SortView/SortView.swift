//
//  SortView.swift
//  PetTrivia
//
//  Created by Sthefanny Gonzaga on 22/06/21.
//

import SwiftUI

var selectedCategory: Category!

struct Category: Identifiable {
    let id: Int
    let text: String
}

struct SortView: View {
    @State var frame: CGSize = .zero
    
    let timer = Timer.publish(every:0.1, on: .main, in: .common).autoconnect()
    let stop = 16
    @State var stopCounter = 0
    @State var animate = false
    @State private var timeRemaining = 4
    
    @State private var isScreenActive = false
    @State private var currentSelectedCategory: Category!
    
    private var model = CategoryOptionViewModel()
    
    var body: some View {
        NavigationView {
            HStack {
                NavigationLink(destination: CountdownView()
                                .navigationBarHidden(true)
                                .navigationBarBackButtonHidden(true), isActive: $isScreenActive){}
                GeometryReader { (geometry) in
                    self.makeView(geometry)
                }
            }
            .background(
                Image("SortBg")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
        )
        }
    }
    
    func makeView(_ geometry: GeometryProxy) -> some View {
        print(geometry.size.width, geometry.size.height)

        let categories = [
            Category(id: 3, text: QuestionCategory.environmentalEnrichment.rawValue),
            Category(id: 2, text: QuestionCategory.allowedFood.rawValue),
            Category(id: 1, text: QuestionCategory.naturalDiet.rawValue),
            Category(id: 0, text: QuestionCategory.allOptions.rawValue)
        ]
        
        DispatchQueue.main.async { self.frame = geometry.size }

        return VStack {
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 33)
                        .foregroundColor(Color.white)
                        .opacity(0.5)
                    
                    VStack {
                        Text("Alimentação")
                            .font(Font.custom("HelveticaNeue", size: 45))
                            .fontWeight(.medium)
                            .foregroundColor(Color("BlueTextColor"))
                        Text("Sorteio de categorias")
                            .font(Font.custom("HelveticaNeue", size: 30))
                            .fontWeight(.thin)
                            .foregroundColor(Color("BlueTextColor"))
                            .padding(.bottom, 30)
                        
                        VStack {
                            ForEach(categories) { category in
                                CategoryOptionView(viewModel: model, id: category.id, text: category.text)
                            }
                        }
                        .onAppear {
                            DispatchQueue.main.async {
                                self.animate = true
                            }
                        }
                        .onReceive(timer) { time in
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                if self.timeRemaining > 0 {
                                    self.stopCounter += 1
                                    
                                    self.timeRemaining -= 1
                                    self.model.selectedId = self.timeRemaining
                                    
                                    if (self.timeRemaining == 0) {
                                        if (self.stopCounter > self.stop) {
                                            self.model.selectedId = Int.random(in: 0...3)
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                                selectedCategory = categories.first(where: { $0.id == self.model.selectedId! })
                                                self.isScreenActive = true
                                            }
                                        }
                                        else {
                                            self.timeRemaining = 4
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            .padding(.vertical, 20)
            .padding(.horizontal, 30)
        }
    }
}

struct SortView_Previews: PreviewProvider {
    static var previews: some View {
        SortView()
    }
}
