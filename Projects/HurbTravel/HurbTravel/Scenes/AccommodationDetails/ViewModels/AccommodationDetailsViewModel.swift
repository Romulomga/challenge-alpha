//
//  AccommodationDetailsViewModel.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 15/06/24.
//

import UIKit

class AccommodationDetailsViewModel {
    
    var navigationDelegate: AccommodationDetailsNavigationLogic?
    var dataStore: AccommodationDetailsDataStore?
    
    init(dataStore: AccommodationDetailsDataStore) {
        self.dataStore = dataStore
    }
    
    func performNavigation(sender: Any?) {
        navigationDelegate?.navigateToDetail(sender: sender)
    }
}
