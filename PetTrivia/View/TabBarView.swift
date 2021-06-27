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

            ProgressView()
                .fullScreenCover(isPresented: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/, content: {
                    SortView()
                })
                .tabItem {
                    Label("Jogar", systemImage: "gamecontroller")
                }
            WikiPetView()
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
