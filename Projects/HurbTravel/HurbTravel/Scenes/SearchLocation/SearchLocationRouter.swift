//
//  SearchLocationRouter.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

// Private segues names
//private enum Segues: String {
//    case toSomewhere
//}

@objc protocol SearchLocationRoutingLogic {
    
    func routeTo(segue: UIStoryboardSegue, sender: Any?)
}

protocol SearchLocationDataPassing {
    
    var dataStore: SearchLocationDataStore? { get }
}

class SearchLocationRouter: NSObject, SearchLocationRoutingLogic, SearchLocationDataPassing {
    
    weak var viewController: SearchLocationViewController?
    var dataStore: SearchLocationDataStore?
    
    init(viewController: SearchLocationViewController, dataStore: SearchLocationDataStore) {
        
        self.viewController = viewController
        self.dataStore = dataStore
    }
    
    // MARK: Routing
    
    func routeTo(segue: UIStoryboardSegue, sender: Any?) {

//        switch segue.identifier {
//
//        case Segues.toSomewhere.rawValue:
//            if let nextController: SomewhereViewController = segue.destination as? SomewhereViewController {
//
//                SomewhereConfigurator.setupArch(viewController: nextController)
//            }
//            break
//
//        default:
//            break
//        }
    }
}
