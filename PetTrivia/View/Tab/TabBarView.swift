//
//  TabBarView.swift
//  PetTrivia
//
//  Created by Naomi Nakanishi on 25/06/21.
//

import SwiftUI

enum Tab {
    case home, preGame, wiki, myPet
}

struct TabBarView: View {
    
    @State var currentTab: Tab = .home
//        didSet() {
//            presentSort = currentTab == .preGame
//        }
    
    @State var presentSort: Bool = false
    
    var body: some View {
        TabView(selection: $currentTab) {
            HomeView() {
                currentTab = .wiki
            } showPreGame: {
                currentTab = .preGame
            }
            
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(Tab.home)

            PreGameView()
                .tabItem {
                    Label("Jogar", systemImage: "gamecontroller")
                }
                .tag(Tab.preGame)
            
            WikiPetView()
                .tabItem {
                    Label("WikiPet", systemImage: "book")
                }
                .tag(Tab.wiki)
            
            MyPetView(dog: UserDefaultsWrapper.fetchDog() ?? (Dog(dogName: "pantufa", dogHat: "strawberry")))
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
        .tabViewStyle(DefaultTabViewStyle())
        .accentColor(.orange)
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .environmentObject(UserDefaultsWrapper())
    }
}
