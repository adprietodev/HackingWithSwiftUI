//
//  AstronautView.swift
//  Moonshot
//
//  Created by Adrian Prieto Villena on 14/6/24.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut

    init(astronaut: Astronaut) {
        self.astronaut = astronaut
    }

    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return AstronautView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
}
