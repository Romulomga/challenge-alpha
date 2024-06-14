//
//  ProductContainer.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

struct ProductContainer: Codable {
    
    private enum CodingKeys: String, CodingKey {
        
        case pagination
        case products = "results"
    }
    
    let pagination: Pagination?
    let products: [Product]?
}

// Decode methods
extension ProductContainer {
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.pagination = try? container.decodeIfPresent(Pagination.self, forKey: .pagination)
        self.products = try? container.decodeIfPresent([Product].self, forKey: .products)
    }
}
