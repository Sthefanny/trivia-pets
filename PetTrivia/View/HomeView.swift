//
//  HomeView.swift
//  PetTrivia
//
//  Created by Sthefanny Gonzaga on 18/06/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var isGamePresented = false
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
                self.makeView()
        }
    }
    
    func makeView() -> some View {

            return VStack(alignment: .center) {
              //  Spacer()
                Image("TitleImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)

            Spacer()
            Spacer()
                HStack {
                    CardView(imageName: "playCardImage", title: "Jogar", bgColorName: "YellowCardColor")
                        .onTapGesture {
                            isGamePresented = true
                        }
                    CardView(imageName: "wikiPetCardImage", title: "WikiPet", bgColorName: "YellowCardColor")
                }
                Spacer()
                HStack {
                    CardView(imageName: "accessoriesCardImage", title: "Acessórios", bgColorName: "YellowCardColor", isEnabled: false)
                    CardView(imageName: "snacksCardImage", title: "Petiscos", bgColorName: "YellowCardColor", isEnabled: false)
                }
                Spacer()
            }
            .padding()
            .fullScreenCover(
                isPresented: $isGamePresented,
                content: { SortView() }
            )
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

