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

    @StateObject var userDefaultsWrapper = UserDefaultsWrapper()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(userDefaultsWrapper)
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
