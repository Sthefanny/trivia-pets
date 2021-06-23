//
//  HomeView.swift
//  PetTrivia
//
//  Created by Sthefanny Gonzaga on 18/06/21.
//

import SwiftUI

struct HomeView: View {
    @State var frame: CGSize = .zero
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            HStack {
                GeometryReader { (geometry) in
                    self.makeView(geometry)
                }
            }
        }
    }
    
    func makeView(_ geometry: GeometryProxy) -> some View {
            print(geometry.size.width, geometry.size.height)

            DispatchQueue.main.async { self.frame = geometry.size }

            return VStack(alignment: .leading) {
                Text("logo do app bonitona")
                    .padding(.all)
                    .background(Color.gray)
                    .frame(width: geometry.size.width)
                Text("Olá, Fulano")
                    .font(Font.custom("HelveticaNeue", size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(Color("BlueTextColor"))
                    .padding(.all)
                HStack {
                    CardView(imageName: "PlayCardImageLarger", title: "Jogar", subtitle: "Coloque em prova seus conhecimentos e aprenda jogando.", bgColorName: "BlueCardColor")
                    CardView(imageName: "AchievementsCardImageLarger", title: "Suas\nconquistas", subtitle: "Biblioteca das informações conquistadas no jogo", bgColorName: "YellowCardColor")
                }
                .padding(.horizontal)
                HorizontalCardView(imageName: "StudyCardImage", backgroundImageName: "StudiesBgImage", title: "Estudos", subtitle: "Para conhecer mais sobre as categorias de perguntas.", bgColorName: "BlueCardColor")
                    .padding(.horizontal)
                Text("Meu Pet")
                    .font(Font.custom("HelveticaNeue", size: 24))
                    .fontWeight(.medium)
                    .foregroundColor(Color("BlueCardTextColor"))
                    .padding([.horizontal, .top])
                HStack {
                    MiniCardView(imageName: "AcessoriesCardImage", backgroundImageName: "AcessoriesBgImage", bgColorName: "YellowCardColor", title: "Acessórios")
                        .padding(.trailing)
                    MiniCardView(imageName: "TreatsCardImage", backgroundImageName: "TreatsBgImage", bgColorName: "YellowCardColor", title: "Petiscos")
                }
                .padding()
            }
            .frame(width: geometry.size.width)
        }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
