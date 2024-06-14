//
//  Amenity.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

struct Amenity: Codable {
    
    private enum CodingKeys: String, CodingKey {
        
        case name
        case category
    }
    
    let name: String
    let category: String
}

// Decode methods
extension Amenity {
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try container.decode(String.self, forKey: .name)
        self.category = try container.decode(String.self, forKey: .category)
    }
}

