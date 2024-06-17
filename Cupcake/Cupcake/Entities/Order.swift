//
//  Order.swift
//  Cupcake
//
//  Created by Adrian Prieto Villena on 17/6/24.
//

import Foundation
import Observation

@Observable
class Order: Codable {
    static let types = ["Vainilla", "Strawberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 3

    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }

    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
    
    var extraFrosting = false
    var addSprinkles = false

    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""

    var cost: Double {
        var cost = Double(quantity) * 2
        cost += (Double(type) / 2)

        if extraFrosting {
            cost += Double(quantity)
        }

        if addSprinkles {
            cost += Double(quantity) / 2
        }

        return cost
    }

    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
        
    }
}
