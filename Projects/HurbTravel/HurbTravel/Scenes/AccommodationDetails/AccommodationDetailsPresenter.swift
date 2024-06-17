//
//  AccommodationDetailsPresenter.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

protocol AccommodationDetailsPresentation {
    
    func presentSetupView(response: AccommodationDetails.Setup.Response)
    func presentShareProduct(response: AccommodationDetails.Share.Response)
}

class AccommodationDetailsPresenter: AccommodationDetailsPresentation {
    
    weak var viewController: AccommodationDetailsDisplay?
    
    init(viewController: AccommodationDetailsDisplay) {
        
        self.viewController = viewController
    }
    
    // MARK: Setup
    
    func presentSetupView(response: AccommodationDetails.Setup.Response) {

        let viewModel: AccommodationDetails.Setup.ViewModel = AccommodationDetails.Setup.ViewModel(product: response.product, descriptionTitle: "Detalhes do \((response.product.category.rawValue ?? "").lowercased())")
        self.viewController?.displaySetupView(viewModel: viewModel)
    }
    
    // MARK: Share

    func presentShareProduct(response: AccommodationDetails.Share.Response) {
        
        let viewModel: AccommodationDetails.Share.ViewModel = AccommodationDetails.Share.ViewModel(sharedText: response.sharedText)
        self.viewController?.displayShareProduct(viewModel: viewModel)
    }
}
