//
//  Pagination.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

struct Pagination: Codable {
    
    private enum CodingKeys: String, CodingKey {
        
        case current
        case count
        case hasNext
    }
    
    let current: Int
    let count: Int
    let hasNext: Bool
}

// Decode methods
extension Pagination {
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.current = try container.decode(Int.self, forKey: .current)
        self.count = try container.decode(Int.self, forKey: .count)
        self.hasNext = try container.decode(Bool.self, forKey: .hasNext)
    }
}
