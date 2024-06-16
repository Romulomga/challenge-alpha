//
//  AccommodationDetailsProtocols.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 15/06/24.
//

import UIKit
import Foundation

protocol AccommodationDetailsNavigationLogic {
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

protocol AccommodationDetailsWorkerProtocol {
    
    func doSomeWork()
}

protocol AccommodationDetailsLogic {
    
    func setupView()
    func shareProduct()
}

protocol AccommodationDetailsDataStore {
    
    var product: Product? { get set }
}

protocol AccommodationDetailsPresentationLogic {
    
    func presentSetupView(response: AccommodationDetails.Setup.Response)
    func presentShareProduct(response: AccommodationDetails.Share.Response)
}
