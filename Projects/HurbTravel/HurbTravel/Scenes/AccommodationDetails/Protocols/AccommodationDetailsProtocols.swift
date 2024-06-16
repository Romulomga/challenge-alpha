//
//  AccommodationDetailsProtocols.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 15/06/24.
//

import UIKit
import Foundation

protocol AccommodationDetailsProtocol {
    
    func doSomeWork()
}

protocol AccommodationDetailsNavigation {
    func navigateToDetail(sender: Any?)
}

protocol AccommodationDetailsRouting {
    func routeTo(segue: UIStoryboardSegue, sender: Any?)
}

protocol AccommodationDetailsDataPassing {
    var dataStore: AccommodationDetailsDataStore? { get }
}

protocol AccommodationDetailsDisplayLogic: AnyObject {
    func displaySetupView(viewModel: AccommodationDetails.Setup.ViewModel)
    func displayShareProduct(viewModel: AccommodationDetails.Share.ViewModel)
}

protocol AccommodationDetailsBusinessLogic {
    
    func buildSetup()
    func shareProduct()
}

protocol AccommodationDetailsPresentationLogic {
    
    func presentSetupView(response: AccommodationDetails.Setup.Response)
    func presentShareProduct(response: AccommodationDetails.Share.Response)
}

protocol AccommodationDetailsDataStore {
    
    var product: Product? { get set }
}
