//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Adrian Prieto Villena on 17/6/24.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
