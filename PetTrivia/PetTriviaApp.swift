//
//  PetTriviaApp.swift
//  PetTrivia
//
//  Created by Sthefanny Gonzaga on 17/06/21.
//

import SwiftUI

@main
struct PetTriviaApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .onAppear{
                    UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(named: "BlueCardTextColor")
                    UIPageControl.appearance().pageIndicatorTintColor = UIColor(named: "BlueCardColor")
                }
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
