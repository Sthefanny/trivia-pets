//
//  TabBarView.swift
//  PetTrivia
//
//  Created by Naomi Nakanishi on 25/06/21.
//

import SwiftUI

enum Tab {
    case home, play, wiki, myPet
}

struct TabBarView: View {
    
    @State var currentTab: Tab = .home
    
    var body: some View {
        TabView(selection: $currentTab) {
            HomeView() {
                currentTab = .home
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(Tab.home)

            ProgressView()
                .fullScreenCover(isPresented: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/, content: {
                    SortView()
                })
                .tabItem {
                    Label("Jogar", systemImage: "gamecontroller")
                }
                .tag(Tab.play)
            WikiPetView()
                .tabItem {
                    Label("WikiPet", systemImage: "book")
                }
                .tag(Tab.wiki)
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
                .tag(Tab.myPet)
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
