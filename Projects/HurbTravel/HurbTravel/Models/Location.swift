//
//  Location.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

struct Location: Codable {
    
    private enum CodingKeys: String, CodingKey {
        
        case state
        case country
        case city
        case text
    }
    
    let state: String?
    let country: String?
    let city: String?
    let text: String?
}

// Decode methods
extension Location {
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.state = try? container.decodeIfPresent(String.self, forKey: .state)
        self.country = try? container.decodeIfPresent(String.self, forKey: .country)
        self.city = try? container.decodeIfPresent(String.self, forKey: .city)
        self.text = try? container.decodeIfPresent(String.self, forKey: .text)
    }
}
