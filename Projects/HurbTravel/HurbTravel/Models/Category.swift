//
//  Category.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

enum Category: Codable, Hashable {
    
    case hotel
    case package
    case activity
    
    case unknown(value: String)
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        let status = try? container.decode(String.self)
        
        switch status {
                
            case "hotel": self = .hotel
            case "pacote": self = .package
            case "atividade": self = .activity

            default:
                self = .unknown(value: status ?? "unknown")
        }
    }
    
    var rawValue: String? {
        
        switch self {
                
            case .hotel: return "Hotel"
            case .package: return "Pacote"
            case .activity: return "Atividade"
            
            default:
                return nil
        }
    }
}
