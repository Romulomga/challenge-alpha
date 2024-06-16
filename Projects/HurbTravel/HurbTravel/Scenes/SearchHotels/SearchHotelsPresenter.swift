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
    
    func presentNewHotels(response: SearchHotelModel.Query.Response) {
        
        let viewModel: SearchHotelModel.Query.ViewModel = SearchHotelModel.Query.ViewModel(pagination: response.pagination, products: response.products)
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
