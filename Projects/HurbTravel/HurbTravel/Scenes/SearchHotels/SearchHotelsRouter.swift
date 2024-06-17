//
//  SearchProductRouter.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

private enum Segues: String {
    case toDetails
}

class SearchHotelsRouter: NSObject, SearchHotelsRoutingLogic, SearchHotelsDataPassing {
    
    weak var viewController: SearchHotelsViewController?
    var dataStore: SearchHotelsDataStore?
    
    init(viewController: SearchHotelsViewController, dataStore: SearchHotelsDataStore) {
        
        self.viewController = viewController
        self.dataStore = dataStore
    }
    
    // MARK: Route to
    
    func routeTo(segue: UIStoryboardSegue, sender: Any?) {

        switch segue.identifier {

        case Segues.toDetails.rawValue:
            if let nextController: AccommodationDetailsViewController = segue.destination as? AccommodationDetailsViewController {

                AccommodationDetailsConfigurator.setup(viewController: nextController)
                
                if let sourceDataStore: SearchHotelsDataStore = self.dataStore,
                   var destinationDataSource: AccommodationDataStore = nextController.router?.dataStore {

                    destinationDataSource.product = sourceDataStore.product
                }
            }
            break

        default:
            break
        }
    }
    
    func navigateToDetails() {
        
        self.viewController?.performSegue(withIdentifier: Segues.toDetails.rawValue, sender: nil)
    }
}
