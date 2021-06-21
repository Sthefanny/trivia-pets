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
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color("BlueTextColor"))
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack {
                    CardView(imageName: "PlayIcon", title: "Jogar", subtitle: "Coloque em prova o conhecimento adquirido jogando", bgColorName: "BlueCardColor")
                    CardView(imageName: "AchievementIcon", title: "Suas conquistas", subtitle: "Biblioteca das informações conquistadas no jogo", bgColorName: "YellowCardColor")
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
