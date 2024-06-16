//
//  SearchLocationRouter.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

class SearchLocationRouter: NSObject, SearchLocationRouting, SearchLocationDataPassing {
    
    weak var viewController: SearchLocationViewController?
    var dataStore: SearchLocationDataStore?
    
    init(viewController: SearchLocationViewController, dataStore: SearchLocationDataStore) {
        
        self.viewController = viewController
        self.dataStore = dataStore
    }
    
    // MARK: Route to
    
    func routeTo(segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
