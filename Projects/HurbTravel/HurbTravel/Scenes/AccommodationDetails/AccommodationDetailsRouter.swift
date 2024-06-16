//
//  AccommodationDetailsRouter.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

class AccommodationDetailsRouter: NSObject, AccommodationDetailsRoutingLogic, AccommodationDetailsDataPassing {
    
    weak var viewController: AccommodationDetailsViewController?
    var dataStore: AccommodationDetailsDataStore?
    
    init(viewController: AccommodationDetailsViewController, dataStore: AccommodationDetailsDataStore) {
        
        self.viewController = viewController
        self.dataStore = dataStore
    }
    
    // MARK: Routing
    
    func routeTo(segue: UIStoryboardSegue, sender: Any?) {
    }
}

