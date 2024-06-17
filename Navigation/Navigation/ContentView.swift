//
//  ContentView.swift
//  Navigation
//
//  Created by Adrian Prieto Villena on 17/6/24.
//

import SwiftUI

struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

struct ContentView: View {
    @State private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(number: 0)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i)
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.blue)
                .toolbarColorScheme(.dark)
                .toolbar(.hidden, for: .navigationBar)
        }
    }
}

struct DetailView: View {
    var number: Int
    
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}

#Preview {
    ContentView()
}
