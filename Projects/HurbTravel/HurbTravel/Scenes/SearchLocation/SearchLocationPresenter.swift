//
//  SearchLocationPresenter.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

protocol SearchLocationPresentationLogic {
    
    func presentLocations(response: SearchLocation.Setup.Response)
    func presentHideSkeleton()
    func presentErrorAlert()
}

class SearchLocationPresenter: SearchLocationPresentationLogic {
    
    weak var viewController: SearchLocationDisplayLogic?
    
    init(viewController: SearchLocationDisplayLogic) {
        
        self.viewController = viewController
    }
    
    // MARK: Do something
    
    func presentLocations(response: SearchLocation.Setup.Response) {
        
        let viewModel: SearchLocation.Setup.ViewModel = SearchLocation.Setup.ViewModel(locations: response.locations)
        self.viewController?.displayLocations(viewModel: viewModel)
    }
    
    func presentHideSkeleton() {
        
        self.viewController?.displayHideSkeleton()
    }
    
    func presentErrorAlert() {
        
        self.viewController?.displayErrorAlert()
    }
}

