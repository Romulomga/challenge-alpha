//
//  SearchLocationProtocols.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 15/06/24.
//

import UIKit
import Foundation

protocol SearchLocationProtocols {
    
    func searchLocations(term: String, limit: Int, completion: @escaping (Result<[Location]?, ServiceError>) -> Void)
}

protocol SearchLocationLogic {
    
    func searchTerm(request: SearchLocation.Setup.Request)
}

protocol SearchLocationDataStore {
    
}

protocol SearchLocationDisplay: AnyObject {
    
    func displayLocations(viewModel: SearchLocation.Setup.ViewModel)
    func displayHideSkeleton()
    func displayErrorAlert()
}

protocol SuggestedResult: AnyObject {

    func didSelectLocation(location: String)
}

protocol SearchLocationDataPassing {
    
    var dataStore: SearchLocationDataStore? { get }
}

protocol SearchLocationPresentation {
    
    func presentLocations(response: SearchLocation.Setup.Response)
    func presentHideSkeleton()
    func presentErrorAlert()
}

@objc protocol SearchLocationRouting {
    
    func routeTo(segue: UIStoryboardSegue, sender: Any?)
}
