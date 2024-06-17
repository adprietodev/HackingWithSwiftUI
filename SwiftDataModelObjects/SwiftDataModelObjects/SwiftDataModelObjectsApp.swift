//
//  SwiftDataModelObjectsApp.swift
//  SwiftDataModelObjects
//
//  Created by Adrian Prieto Villena on 17/6/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataModelObjectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
