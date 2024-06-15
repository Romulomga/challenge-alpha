//
//  Media.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

struct Media: Codable {
    
    private enum CodingKeys: String, CodingKey {
        
        case url
    }
    
    let url: String
}

extension Media {
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.url = try container.decode(String.self, forKey: .url)
    }
}
