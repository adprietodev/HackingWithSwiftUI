//
//  ContentView.swift
//  Cupcake
//
//  Created by Adrian Prieto Villena on 17/6/24.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    @State private var order = Order()

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }

                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity)
                }
                Section {
                    Toggle("Any special request?", isOn: $order.specialRequestEnabled)

                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                Section {
                    NavigationLink("Delivery details") {
                        AddressView(order: order)
                    }
                }
                .disabled(order.hasValidAddress == false)
            }
            .navigationTitle("Cupcake Corner")
        }
    }

}

#Preview {
    ContentView()
}