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
    
    @State var currentTab: Tab = .home {
        didSet {
            presentSort = currentTab == .play
        }
    }
    @State var presentSort: Bool = false
    
    var body: some View {
        TabView(selection: $currentTab) {
            HomeView() {
                currentTab = .wiki
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(Tab.home)

            ProgressView()
                .fullScreenCover(isPresented: $presentSort, content: {
                    SortView()
                })
                .tabItem {
                    Label("Jogar", systemImage: "gamecontroller")
                        .onTapGesture {
                            currentTab = .play
                        }
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
        .tabViewStyle(DefaultTabViewStyle())
        .accentColor(.orange)
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
