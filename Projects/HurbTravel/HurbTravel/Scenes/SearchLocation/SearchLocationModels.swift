//
//  SearchLocationModels.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

enum SearchLocation {
    
    // MARK: Use cases
    
    enum Setup {
        
        struct Request {
            
            var term: String
            var limit: Int
        }
        
        struct Response {
            
            var locations: [String]
        }
        
        struct ViewModel {
            
            var locations: [String]
        }
    }
}

