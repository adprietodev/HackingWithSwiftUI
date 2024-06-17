//
//  User.swift
//  Cupcake
//
//  Created by Adrian Prieto Villena on 17/6/24.
//

import Foundation
import Observation

@Observable
class User: Codable {
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
    var name = "Taylor"
}
