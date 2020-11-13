//
//  ContentView.swift
//  OutfitExpressCD
//
//  Created by Efaliso Tamerat on 12/11/2020.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        HomeView()
    }

}
