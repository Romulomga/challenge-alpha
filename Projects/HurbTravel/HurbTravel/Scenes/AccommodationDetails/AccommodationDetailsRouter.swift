//
//  AccommodationDetailsRouter.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

protocol AccommodationDetailsDataPassing {
    var dataStore: AccommodationDataStore? { get }
}

class AccommodationDetailsRouter: NSObject, /*AccommodationDetailsRouting,*/ AccommodationDetailsDataPassing {
    
    weak var viewController: AccommodationDetailsViewController?
    var dataStore: AccommodationDataStore?
    
    init(viewController: AccommodationDetailsViewController, dataStore: AccommodationDataStore) {
        
        self.viewController = viewController
        self.dataStore = dataStore
    }
}
