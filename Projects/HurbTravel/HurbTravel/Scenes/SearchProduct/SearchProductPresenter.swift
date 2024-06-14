//
//  SearchProductPresenter.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

protocol SearchProductPresentationLogic {
    
    func presentNewProducts(response: SearchProduct.Query.Response)
    func presentNoSearchResultsView()
    func presentErrorAlert()
    
    func presentProductDetails()
}

class SearchProductPresenter: SearchProductPresentationLogic {
    
    weak var viewController: SearchProductDisplayLogic?
    
    init(viewController: SearchProductDisplayLogic) {
        
        self.viewController = viewController
    }
    
    // MARK: Do something
    
    func presentNewProducts(response: SearchProduct.Query.Response) {
        
        let viewModel: SearchProduct.Query.ViewModel = SearchProduct.Query.ViewModel(pagination: response.pagination, products: response.products)
        self.viewController?.displayNewProducts(viewModel: viewModel)
    }
    
    func presentNoSearchResultsView() {
        
        self.viewController?.displayNoSearchResultsView()
    }
    
    func presentErrorAlert() {
        
        self.viewController?.displayErrorAlert()
    }
    
    func presentProductDetails() {
        
        self.viewController?.displayProductDetails()
    }
}

