//
//  ProductDetailsRouter.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

@objc protocol ProductDetailsRoutingLogic {
    
    func routeTo(segue: UIStoryboardSegue, sender: Any?)
}

protocol ProductDetailsDataPassing {
    
    var dataStore: ProductDetailsDataStore? { get }
}

class ProductDetailsRouter: NSObject, ProductDetailsRoutingLogic, ProductDetailsDataPassing {
    
    weak var viewController: ProductDetailsViewController?
    var dataStore: ProductDetailsDataStore?
    
    init(viewController: ProductDetailsViewController, dataStore: ProductDetailsDataStore) {
        
        self.viewController = viewController
        self.dataStore = dataStore
    }
    
    // MARK: Routing
    
    func routeTo(segue: UIStoryboardSegue, sender: Any?) {
    }
}

