//
//  AccommodationDetailsModel.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import Foundation

enum AccommodationDetails {
    
    // MARK: Use cases
    
    enum Setup {
        
        struct Request {
            
        }
        
        struct Response {
            
            var product: Product
        }
        
        struct ViewModel {
            
            var product: Product
            var descriptionTitle: String
        }
    }
    
    enum Share {
        
        struct Request {
            
        }
        
        struct Response {
            
            var sharedText: String
        }
        
        struct ViewModel {
            
            var sharedText: String
        }
    }
}
