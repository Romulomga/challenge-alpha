//
//  ProductDetailsModels.swift
//  Hurb-iOS-Challenge
//
//  Created by Rômulo Monteiro on 19/01/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum ProductDetails {
    
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
