//
//  SearchLocationPresenter.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

class SearchLocationPresenter: SearchLocationPresentation {
    
    weak var viewController: SearchLocationDisplay?
    
    init(viewController: SearchLocationDisplay) {
        
        self.viewController = viewController
    }
    
    // MARK: Do 
    
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
