//
//  PetTriviaApp.swift
//  PetTrivia
//
//  Created by Sthefanny Gonzaga on 17/06/21.
//

import SwiftUI

@main
struct PetTriviaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
