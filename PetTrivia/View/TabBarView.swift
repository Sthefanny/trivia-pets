//
//  TabBarView.swift
//  PetTrivia
//
//  Created by Naomi Nakanishi on 25/06/21.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            //PlayView()
            Text("em construção")
                .tabItem {
                    Label("Jogar", systemImage: "gamecontroller")
                }
            //WikiPetView()
            Text("aqui vai a wikipet")
                .tabItem {
                    Label("WikiPet", systemImage: "book")
                }
            Text("aqui vai a aba meu pet")
                .tabItem {
                    Label(
                        title: { Text("Meu Pet") },
                        icon: { Image("pawOutline")
                            .renderingMode(.template)
                            .foregroundColor(.blue)
                        }
                    )
                }
        }
        .tabViewStyle(/*@START_MENU_TOKEN@*/DefaultTabViewStyle()/*@END_MENU_TOKEN@*/)
        .accentColor(.orange)
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
