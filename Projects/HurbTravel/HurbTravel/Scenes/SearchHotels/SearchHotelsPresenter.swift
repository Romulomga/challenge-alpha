//
//  SearchProductPresenter.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

class SearchHotelsPresenter: SearchHotelsPresentationLogic {
    
    weak var viewController: SearchHotelsDisplayLogic?
    
    init(viewController: SearchHotelsDisplayLogic) {
        
        self.viewController = viewController
    }
    
    // MARK: Do something
    
    func presentNewHotels(response: SearchProduct.Query.Response) {
        
        let viewModel: SearchProduct.Query.ViewModel = SearchProduct.Query.ViewModel(pagination: response.pagination, products: response.products)
        self.viewController?.displayNewHotels(viewModel: viewModel)
    }
    
    func presentNoSearchResultsView() {
        
        self.viewController?.displayNoSearchResultsView()
    }
    
    func presentErrorAlert() {
        
        self.viewController?.displayErrorAlert()
    }
    
    func presentHotelsDetails() {
        
        self.viewController?.displayHotelsDetails()
    }
}
