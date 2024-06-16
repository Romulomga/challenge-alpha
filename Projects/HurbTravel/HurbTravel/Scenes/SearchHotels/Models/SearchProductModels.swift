//
//  SearchProductModels.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

enum SearchProduct {
    
    enum Query {
        
        struct Request {
            
            var term: String
            var page: Int
            var limit: Int
        }
        
        struct Response {
            
            var pagination: Pagination?
            var products: [Product]
        }
        
        struct ViewModel {
            
            var pagination: Pagination?
            var products: [Product]
        }
    }
    
    enum Selection {
        
        struct Request {
            
            var product: Product
        }
        
        struct Response {
            
        }
        
        struct ViewModel {
            
        }
    }
}
