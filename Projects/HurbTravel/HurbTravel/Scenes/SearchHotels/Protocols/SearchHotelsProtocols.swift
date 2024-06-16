//
//  SearchHotelsProtocol.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 15/06/24.
//

import UIKit
import Foundation

protocol SearchProductProtocol {
    
    func searchProducts(term: String, page: Int, limit: Int, completion: @escaping (Result<Container, ServiceError>) -> Void)
}

protocol SearchProductDataStore {
    
    var product: Product? { get set }
}

protocol SearchProductDataPassing {
    
    var dataStore: SearchProductDataStore? { get }
}

protocol SearchProductBusinessLogic {
    
    func searchProducts(request: SearchProduct.Query.Request)
    func didSeletedProduct(request: SearchProduct.Selection.Request)
}

protocol SearchProductDisplayLogic: AnyObject {
    
    func displayNewProducts(viewModel: SearchProduct.Query.ViewModel)
    func displayNoSearchResultsView()
    func displayErrorAlert()
    
    func displayProductDetails()
}

protocol SearchProductPresentationLogic {
    
    func presentNewProducts(response: SearchProduct.Query.Response)
    func presentNoSearchResultsView()
    func presentErrorAlert()
    
    func presentProductDetails()
}

@objc protocol SearchProductRoutingLogic {
    
    func routeTo(segue: UIStoryboardSegue, sender: Any?)
    func navigateToDetails()
}
