//
//  SearchHotelsProtocols.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 15/06/24.
//

import UIKit
import Foundation

protocol SearchHotelsProtocols {
    
    func searchHotels(term: String, page: Int, limit: Int, completion: @escaping (Result<Container, ServiceError>) -> Void)
}

protocol SearchHotelsDataStore {
    
    var product: Product? { get set }
}

protocol SearchHotelsDataPassing {
    
    var dataStore: SearchHotelsDataStore? { get }
}

protocol SearchHotelsBusinessLogic {
    
    func searchHotels(request: SearchProduct.Query.Request)
    func didSelectedHotel(request: SearchProduct.Selection.Request)
}

protocol SearchHotelsDisplayLogic: AnyObject {
    
    func displayNewHotels(viewModel: SearchProduct.Query.ViewModel)
    func displayNoSearchResultsView()
    func displayErrorAlert()
    
    func displayHotelsDetails()
}

protocol SearchHotelsPresentationLogic {
    
    func presentNewHotels(response: SearchProduct.Query.Response)
    func presentNoSearchResultsView()
    func presentErrorAlert()
    
    func presentHotelsDetails()
}

@objc protocol SearchHotelsRoutingLogic {
    
    func routeTo(segue: UIStoryboardSegue, sender: Any?)
    func navigateToDetails()
}
