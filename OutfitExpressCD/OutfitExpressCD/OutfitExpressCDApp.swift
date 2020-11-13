//
//  OutfitExpressCDApp.swift
//  OutfitExpressCD
//
//  Created by Efaliso Tamerat on 12/11/2020.
//

import SwiftUI

@main
struct OutfitExpressCDApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
